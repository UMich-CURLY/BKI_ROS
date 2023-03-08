from config import config, update_config
import torch
from argparse import Namespace
import models
import numpy as np

def load_model():
    args = Namespace(cfg='experiments/rellis/seg_hrnet_ocr_w48_train_512x1024_sgd_lr1e-3_wd5e-4_bs_12_epoch484.yaml',
                     save=False,
                     data_cfg='config/rellis.yaml',
                     opts=['DATASET.TEST_SET', 'val.lst', 'OUTPUT_DIR', '/home/user/fill/',
                           'TEST.MODEL_FILE', 'weights/best.pth'])
    update_config(config, args)
    module = eval('models.seg_hrnet_ocr')
    module.BatchNorm2d_class = module.BatchNorm2d = torch.nn.BatchNorm2d
    model = eval('models.seg_hrnet_ocr.get_seg_model')(config)
    model_state_file = config.TEST.MODEL_FILE
    pretrained_dict = torch.load(model_state_file)
    model_dict = model.state_dict()
    pretrained_dict = {k[6:]: v for k, v in pretrained_dict.items()
                       if k[6:] in model_dict.keys()}
    model_dict.update(pretrained_dict)
    model.load_state_dict(model_dict)
    return model.cuda()

def get_labels(pred):
    pred = pred[config.TEST.OUTPUT_INDEX]
    pred_np = pred.detach().cpu().numpy()

    pred_arg = np.argmax(pred_np[0], axis=0).astype(np.uint8)
    return convert_label(pred_arg, True)

def convert_color(label, color_map):
    temp = np.zeros(label.shape + (3,)).astype(np.uint8)
    for k, v in color_map.items():
        temp[label == k] = v
    return temp

def convert_label(label, inverse=False):
    label_mapping = {0: 0,
                     1: 0,
                     3: 1,
                     4: 2,
                     5: 3,
                     6: 4,
                     7: 5,
                     8: 6,
                     9: 7,
                     10: 8,
                     12: 9,
                     15: 10,
                     17: 11,
                     18: 12,
                     19: 13,
                     23: 14,
                     27: 15,
                    #  29: 1,
                    #  30: 1,
                     31: 16,
                    #  32: 4,
                     33: 17,
                     34: 18}
    temp = label.copy()
    # temp = torch.clone(label)
    # temp[:,:,:] = label
    # temp = label.clone()
    if inverse:
        for v,k in label_mapping.items():
            temp[label == k] = v
    else:
        for k, v in label_mapping.items():
            temp[label == k] = v
    return temp