import torch
import torch.nn as nn
import torch.nn.functional as F


class SMNet(nn.Module):
    def __init__(self, ego_feat_dim, mem_feat_dim, n_obj_classes, ego_downsample, device, model_type="GRU"):
        super(SMNet, self).__init__()
        self.mem_feat_dim = mem_feat_dim
        self.ego_downsample = ego_downsample
        self.device = device
        self.device_mem = device

        self.model_type = model_type

        if self.model_type == "GRU":
            self.rnn = nn.GRUCell(ego_feat_dim, mem_feat_dim, bias=True)

            noise = 0.01
            self.rnn.weight_hh.data = -noise + 2 * noise * torch.rand_like(self.rnn.weight_hh)
            self.rnn.weight_ih.data = -noise + 2 * noise * torch.rand_like(self.rnn.weight_ih)
            self.rnn.bias_hh.data = torch.zeros_like(self.rnn.bias_hh)  # redundant with bias_ih
            self.rnn.bias_ih.data = -noise + 2 * noise * torch.rand_like(self.rnn.bias_ih)

        elif self.model_type == "linear":
            self.linlayer = nn.Linear(ego_feat_dim, mem_feat_dim)

        elif self.model_type == 'LSTM':
            self.rnn = nn.LSTMCell(ego_feat_dim, mem_feat_dim, bias=True)

            # change default LSTM initialization
            noise = 0.01
            self.rnn.weight_hh.data = -noise + 2 * noise * torch.rand_like(self.rnn.weight_hh)
            self.rnn.weight_ih.data = -noise + 2 * noise * torch.rand_like(self.rnn.weight_ih)
            self.rnn.bias_hh.data = torch.zeros_like(self.rnn.bias_hh)  # redundant with bias_ih
            self.rnn.bias_ih.data = -noise + 2 * noise * torch.rand_like(self.rnn.bias_ih)

        self.decoder = SemmapDecoder(mem_feat_dim, n_obj_classes)

    def weights_init(self, m):
        classname = m.__class__.__name__
        if classname.find('Conv') != -1:
            nn.init.kaiming_normal_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif classname.find('BatchNorm') != -1:
            m.weight.data.fill_(1.)
            m.bias.data.fill_(1e-4)

    def encode(self, features, masks_inliers):

        features = features.float()

        N, T, H, W, C = features.shape

        if self.model_type == "LSTM":
            state = (torch.zeros((N, 256, 256, self.mem_feat_dim), dtype=torch.float, device=self.device_mem),
                     torch.zeros((N, 256, 256, self.mem_feat_dim), dtype=torch.float, device = self.device_mem))
        else:
            state = torch.zeros((N, 256, 256, self.mem_feat_dim), dtype=torch.float, device=self.device_mem)

        observed_masks = torch.zeros((N, 256, 256), dtype=torch.int, device=self.device)

        for t in range(T):
            for n in range(N):
                feature_i = features[n, t]
                inliers = masks_inliers[n, t]

                m = (inliers > 0)
                if m.any():
                    feature = feature_i[m]
                    if self.model_type == "GRU":
                        tmp_state = state[n, m].to(self.device)
                        tmp_state = self.rnn(feature, tmp_state)
                        state[n, m] = tmp_state.to(self.device_mem)
                    elif self.model_type == "LSTM":
                        tmp_state = (state[0][n, m].to(self.device), state[1][n, m].to(self.device))
                        tmp_state = self.rnn(feature, tmp_state)
                        state[0][n, m] = tmp_state[0].to(self.device_mem)
                        state[1][n, m] = tmp_state[1].to(self.device_mem)
                    elif self.model_type == "linear":
                        tmp_memory = self.linlayer(feature)
                        state[n, m] = tmp_memory.to(self.device_mem)

                    observed_masks[n, :, :] += inliers.reshape(256, 256)

        if self.model_type == "LSTM":
            memory = state[0]
        else:
            memory = state

        memory = memory.permute(0, 3, 1, 2)
        memory = memory.to(self.device)

        return memory, observed_masks

    def forward(self, features, masks_inliers):

        memory, observed_masks = self.encode(features, masks_inliers)

        semmap = self.decoder(memory)

        return semmap, observed_masks


class SemmapDecoder(nn.Module):
    def __init__(self, feat_dim, n_obj_classes):
        super(SemmapDecoder, self).__init__()

        self.layer = nn.Sequential(nn.Conv2d(feat_dim, 128, kernel_size=7, stride=1, padding=3, bias=False),
                                   nn.BatchNorm2d(128),
                                   nn.ReLU(inplace=True),
                                   nn.Conv2d(128, 64, kernel_size=3, stride=1, padding=1, bias=False),
                                   nn.BatchNorm2d(64),
                                   nn.ReLU(inplace=True),
                                   nn.Conv2d(64, 48, kernel_size=3, stride=1, padding=1, bias=False),
                                   nn.BatchNorm2d(48),
                                   nn.ReLU(inplace=True),
                                   )

        self.obj_layer = nn.Sequential(nn.Conv2d(48, 48, kernel_size=3, stride=1, padding=1, bias=False),
                                       nn.BatchNorm2d(48),
                                       nn.ReLU(inplace=True),
                                       nn.Conv2d(48, n_obj_classes,
                                                 kernel_size=1, stride=1,
                                                 padding=0, bias=True),
                                       )

    def forward(self, memory):
        l1 = self.layer(memory)
        out_obj = self.obj_layer(l1)
        return out_obj
