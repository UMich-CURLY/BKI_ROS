from torch.utils.data import Dataset, DataLoader
import torch.optim as optim
from torch.utils.tensorboard import SummaryWriter
import yaml
from Data.CarlaConvBKI import *
import rospy

import sys
sys.path.append("../EndToEnd/")
from Segmentation.spvcnn import *
from ConvBKI.ConvBKI import *

from utils import *

MODEL_CONFIG = "ConvBKI"
DATA_CONFIG = "Carla"


model_params_file = os.path.join(os.getcwd(), "Configs", MODEL_CONFIG + ".yaml")
print(model_params_file)
with open(model_params_file, "r") as stream:
    try:
        model_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

data_params_file = os.path.join(os.getcwd(), "Configs", DATA_CONFIG + ".yaml")
with open(data_params_file, "r") as stream:
    try:
        data_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

T = model_params["T"]
train_dir = data_params["train_dir"]
val_dir = data_params["val_dir"]
test_dir = data_params["test_dir"]
num_workers = data_params["num_workers"]
remap = model_params["remap"]
seed = model_params["seed"]
B = 1

coor_ranges = data_params['min_bound'] + data_params['max_bound']
voxel_sizes = [abs(coor_ranges[3] - coor_ranges[0]) / data_params["x_dim"],
              abs(coor_ranges[4] - coor_ranges[1]) / data_params["y_dim"],
              abs(coor_ranges[5] - coor_ranges[2]) / data_params["z_dim"]]
grid_size = torch.tensor((data_params["x_dim"], data_params["y_dim"], data_params["z_dim"])).to(device)
min_bound = torch.tensor(data_params["min_bound"]).to(device)
max_bound = torch.tensor(data_params["max_bound"]).to(device)

model = ConvBKI(grid_size, min_bound, max_bound,
                    filter_size=model_params["f"], num_classes=data_params["num_classes"], device=device).to(device)

epsilon_w = 1e-5  # eps to avoid zero division
class_frequencies = np.array(data_params["counts"], dtype=np.float32)
weights = np.zeros(class_frequencies.shape)
weights[1:] = (1 / np.log(class_frequencies[1:] + epsilon_w) )
weights = torch.from_numpy(weights).to(device=device, non_blocking=True).float()
criterion = nn.NLLLoss(weight=weights, ignore_index=0)

carla_ds = CarlaDataset(directory=train_dir, num_frames=T, remap=remap, bev=False)
dataloader_train = DataLoader(carla_ds, batch_size=1, shuffle=False, collate_fn=carla_ds.collate_fn, num_workers=num_workers)
val_ds = CarlaDataset(directory=val_dir,num_frames=T, remap=remap, bev=False)
dataloader_val = DataLoader(val_ds, batch_size=1, shuffle=False, collate_fn=val_ds.collate_fn, num_workers=num_workers)
test_ds = CarlaDataset(directory=val_dir, num_frames=T,  remap=remap, bev=False)
dataloader_test = DataLoader(test_ds, batch_size=1, shuffle=False, collate_fn=test_ds.collate_fn, num_workers=num_workers)

writer = SummaryWriter("./Models/Runs/" + MODEL_CONFIG)
save_dir = "./Models/Weights/" + MODEL_CONFIG

if not os.path.exists(save_dir):
    os.makedirs(save_dir)

if device == "cuda":
    torch.cuda.empty_cache()

setup_seed(seed)

# Segmentation
seg_net = SPVCNN(
    num_classes=data_params["num_classes"],
    cr=model_params["cr"],
    pres=model_params["pres"],
    vres=model_params["vres"]).to(device)

seg_net.load_state_dict(torch.load(model_params["weights_path"])['model'])
seg_net.eval()

rospy.init_node('talker', anonymous=True)
map_pub = rospy.Publisher('SemMap_global', MarkerArray, queue_size=10)


def data_loop(dataloader):
    model.eval()
    next_map = MarkerArray()
    for horizon_batch, pose_batch, output_batch in dataloader:
        with torch.no_grad():
            all_points, batch_labels = gen_convbki_input(pose_batch, horizon_batch, seg_net, device, model_params)
        for b in range(len(all_points)):
            current_map = torch.zeros(model.grid_size[0], model.grid_size[1], model.grid_size[2],
                                   model.num_classes, device=model.device, requires_grad=True,
                                   dtype=torch.float32) + model.prior
            pc_np = np.vstack(np.array(all_points[b]))
            all_labels = torch.vstack(batch_labels[b])
            pc_torch = torch.from_numpy(pc_np).to(device)
            labeled_pc_torch = torch.hstack((pc_torch, all_labels)).to(torch.float32)

            preds = model(current_map, labeled_pc_torch)

            colors = remap_colors(data_params["colors"])
            if rospy.is_shutdown():
                exit("Closing Python")
            try:
                next_map = publish_local_map(preds, model.centroids, data_params["max_bound"],
                                             data_params["min_bound"], grid_size.cpu().numpy(), colors, next_map)
                map_pub.publish(next_map)
            except:
                exit("Publishing broke")


data_loop(dataloader_train)
