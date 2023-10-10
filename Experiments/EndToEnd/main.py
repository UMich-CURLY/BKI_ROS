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

# DATA_CONFIG = "KITTI/default"
# MODEL_CONFIG = "model/KITTI"
DATA_CONFIG = "rellis/default"
MODEL_CONFIG = "model/Rellis"

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

if "rellis" in DATA_CONFIG:
    dataset = Rellis(data_params["root"], "Train")
elif "KITTI" in DATA_CONFIG:
    dataset = KITTI(data_params["root"], "")

loader = DataLoader(dataset, batch_size=1, shuffle=False, collate_fn=dataset.collate_fn, num_workers=1)
dev = 'cuda' if torch.cuda.is_available() else 'cpu'
dtype = torch.float32

e2e_net = load_model(model_params, dev)

rospy.init_node('talker', anonymous=True)
map_pub = rospy.Publisher('SemMap_global', MarkerArray, queue_size=10)
var_pub = rospy.Publisher('VarMap_global', MarkerArray, queue_size=10)
next_map = MarkerArray()
var_map = MarkerArray()

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
        print(idx, time.time() - start_t)

    if rospy.is_shutdown():
        exit("Closing Python")
    try:
        if idx % 50 != 49:
            continue
        # reset_vis(map_pub)
        next_map = publish_local_map(e2e_net.grid, e2e_net.convbki_net.centroids, model_params["voxel_sizes"],
                                     data_params["colors"], next_map, e2e_net.propagation_net.translation)
        var_map = publish_var_map(e2e_net.grid, e2e_net.convbki_net.centroids, model_params["voxel_sizes"],
                                     data_params["colors"], var_map, e2e_net.propagation_net.translation)
        map_pub.publish(next_map)
        var_pub.publish(var_map)
        rospy.sleep(0.05)
    except:
        exit("Publishing broke")
    time.sleep(5)