import yaml
import os
from torch.utils.data import Dataset, DataLoader
import torch
from Segmentation.utils import *
from utils import *
import time
import rospy
from visualization_msgs.msg import MarkerArray
from Data.Rellis import *
from Data.KITTI import *

DATA_CONFIG = "KITTI/default"
MODEL_CONFIG = "model/KITTI"
noise_level = 0.95

# Data Parameters
data_params_file = os.path.join(os.getcwd(), "Configs", DATA_CONFIG + ".yaml")
with open(data_params_file, "r") as stream:
    try:
        data_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)
# Model Parameters
model_params_file = os.path.join(os.getcwd(), "Configs", MODEL_CONFIG + ".yaml")
with open(model_params_file, "r") as stream:
    try:
        model_params = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

dataset = KITTI(data_params["root"], "", get_gt=True)

loader = DataLoader(dataset, batch_size=1, shuffle=False, collate_fn=dataset.collate_fn, num_workers=1)
dev = 'cuda' if torch.cuda.is_available() else 'cpu'
dtype = torch.float32

e2e_net = load_model(model_params, dev)
e2e_net.noise = noise_level

labels_reverse = torch.zeros(500).to(dev)
labels_reverse[49] = 1
labels_reverse[50] = 2
labels_reverse[20] = 4
labels_reverse[30] = 4
labels_reverse[31] = 4
labels_reverse[72] = 5
labels_reverse[80] = 5
labels_reverse[32] = 6
labels_reverse[40] = 6
labels_reverse[48] = 7
labels_reverse[71] = 7
labels_reverse[44] = 8
labels_reverse[51] = 9
labels_reverse[70] = 9
labels_reverse[0] = 10
labels_reverse[10] = 10
labels_reverse[11] = 10
labels_reverse[15] = 10
labels_reverse[18] = 10
labels_reverse[[i for i in range(252, 259)]] = 10

total_correct = 0
total_num = 0
current_scene = dataset.scene_nums[0]
for idx in range(len(dataset)):
    with torch.no_grad():
        if dataset.scene_nums[idx] != current_scene:
            current_scene = dataset.scene_nums[idx]
            e2e_net.initialize_grid()
        # Load data (Only one at a time)
        in_dict = dataset[idx]
        lidar = in_dict["lidar"][0]
        seg_input, inv = generate_seg_in(lidar, model_params["res"])
        lidar_pose = in_dict["poses"][0]

        input_data = [torch.tensor(lidar_pose).to(dev).type(dtype), torch.tensor(lidar).to(dev).type(dtype),
                      seg_input, torch.tensor(inv).to(dev)]
        start_t = time.time()
        e2e_net(input_data)

        # Get predictions from points
        lidar = torch.tensor(lidar).to(dev)
        transformed_lidar = torch.matmul(e2e_net.ego_to_map[:3, :3], lidar[:, :3].T).T + e2e_net.ego_to_map[:3, 3]
        grid_pc = e2e_net.convbki_net.grid_ind(transformed_lidar).long()
        preds = e2e_net.grid[grid_pc[:, 0], grid_pc[:, 1], grid_pc[:, 2]]
        max_preds = torch.argmax(preds, dim=-1)

        # Mask ground truth
        gt = in_dict["gt"][0]
        valid_input_mask = torch.all((transformed_lidar < e2e_net.convbki_net.max_bound) &
                                     (transformed_lidar >= e2e_net.convbki_net.min_bound), axis=1)
        valid_gt = torch.tensor(gt).to(dev)[valid_input_mask] & 0xFFFF

        remapped_gt = labels_reverse[valid_gt.long() & 0xFFFF]

        correct = torch.sum(max_preds.long() == remapped_gt.long())
        total = max_preds.shape[0]
        total_correct += correct
        total_num += total
print(noise_level, 100 * total_correct/total_num)