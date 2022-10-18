import torch.nn.functional as F
import torch.nn as nn
import torch


# From MotionNet
class CellClassification(nn.Module):
    def __init__(self, category_num=5):
        super(CellClassification, self).__init__()
        self.conv1 = nn.Conv2d(32, 32, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(32, category_num, kernel_size=1, stride=1, padding=0)

        self.bn1 = nn.BatchNorm2d(32)

    def forward(self, x):
        print(x.shape)
        x = F.relu(self.bn1(self.conv1(x)))
        x = self.conv2(x)

        return x


class Conv3D(nn.Module):
    def __init__(self, in_channel, out_channel, kernel_size, stride, padding):
        super(Conv3D, self).__init__()
        self.conv3d = nn.Conv3d(in_channel, out_channel, kernel_size=kernel_size, stride=stride, padding=padding)
        self.bn3d = nn.BatchNorm3d(out_channel)

    def forward(self, x):
        # input x: (batch, seq, c, h, w)
        x = x.permute(0, 2, 1, 3, 4).contiguous()  # (batch, c, seq_len, h, w)
        x = F.relu(self.bn3d(self.conv3d(x)))
        x = x.permute(0, 2, 1, 3, 4).contiguous()  # (batch, seq_len, c, h, w)

        return x


def TemporalPooling(x, batch):
    x = x.view(batch, -1, x.size(1), x.size(2), x.size(3))
    x = x.permute(0, 2, 1, 3, 4).contiguous()
    x = F.adaptive_max_pool3d(x, (1, None, None))
    x = x.permute(0, 2, 1, 3, 4).contiguous()
    x = x.view(-1, x.size(2), x.size(3), x.size(4)).contiguous()
    return x


# From LMSCNet
class SegmentationHead(nn.Module):
  '''
  3D Segmentation heads to retrieve semantic segmentation at each scale.
  Formed by Dim expansion, Conv3D, ASPP block, Conv3D.
  '''
  def __init__(self, inplanes, planes, nbr_classes, dilations_conv_list):
    super().__init__()

    # First convolution
    self.conv0 = nn.Conv3d(inplanes, planes, kernel_size=3, padding=1, stride=1)

    # ASPP Block
    self.conv_list = dilations_conv_list
    self.conv1 = nn.ModuleList(
      [nn.Conv3d(planes, planes, kernel_size=3, padding=dil, dilation=dil, bias=False) for dil in dilations_conv_list])
    self.bn1 = nn.ModuleList([nn.BatchNorm3d(planes) for dil in dilations_conv_list])
    self.conv2 = nn.ModuleList(
      [nn.Conv3d(planes, planes, kernel_size=3, padding=dil, dilation=dil, bias=False) for dil in dilations_conv_list])
    self.bn2 = nn.ModuleList([nn.BatchNorm3d(planes) for dil in dilations_conv_list])
    self.relu = nn.ReLU(inplace=True)

    # Convolution for output
    self.conv_classes = nn.Conv3d(planes, nbr_classes, kernel_size=3, padding=1, stride=1)

  def forward(self, x_in):

    # Dimension exapension
    x_in = x_in[:, None, :, :, :]

    # Convolution to go from inplanes to planes features...
    x_in = self.relu(self.conv0(x_in))

    y = self.bn2[0](self.conv2[0](self.relu(self.bn1[0](self.conv1[0](x_in)))))
    for i in range(1, len(self.conv_list)):
      y += self.bn2[i](self.conv2[i](self.relu(self.bn1[i](self.conv1[i](x_in)))))
    x_in = self.relu(y + x_in)  # modified

    x_in = self.conv_classes(x_in)

    return x_in