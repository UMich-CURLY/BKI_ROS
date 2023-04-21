// Generated by gencpp from file lio_sam/cloud_info.msg
// DO NOT EDIT!


#ifndef LIO_SAM_MESSAGE_CLOUD_INFO_H
#define LIO_SAM_MESSAGE_CLOUD_INFO_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/PointCloud2.h>

namespace lio_sam
{
template <class ContainerAllocator>
struct cloud_info_
{
  typedef cloud_info_<ContainerAllocator> Type;

  cloud_info_()
    : header()
    , startRingIndex()
    , endRingIndex()
    , pointColInd()
    , pointRange()
    , imuAvailable(0)
    , odomAvailable(0)
    , imuRollInit(0.0)
    , imuPitchInit(0.0)
    , imuYawInit(0.0)
    , initialGuessX(0.0)
    , initialGuessY(0.0)
    , initialGuessZ(0.0)
    , initialGuessRoll(0.0)
    , initialGuessPitch(0.0)
    , initialGuessYaw(0.0)
    , cloud_deskewed()
    , cloud_corner()
    , cloud_surface()
    , key_frame_cloud()
    , key_frame_color()
    , key_frame_poses()
    , key_frame_map()  {
    }
  cloud_info_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , startRingIndex(_alloc)
    , endRingIndex(_alloc)
    , pointColInd(_alloc)
    , pointRange(_alloc)
    , imuAvailable(0)
    , odomAvailable(0)
    , imuRollInit(0.0)
    , imuPitchInit(0.0)
    , imuYawInit(0.0)
    , initialGuessX(0.0)
    , initialGuessY(0.0)
    , initialGuessZ(0.0)
    , initialGuessRoll(0.0)
    , initialGuessPitch(0.0)
    , initialGuessYaw(0.0)
    , cloud_deskewed(_alloc)
    , cloud_corner(_alloc)
    , cloud_surface(_alloc)
    , key_frame_cloud(_alloc)
    , key_frame_color(_alloc)
    , key_frame_poses(_alloc)
    , key_frame_map(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _startRingIndex_type;
  _startRingIndex_type startRingIndex;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _endRingIndex_type;
  _endRingIndex_type endRingIndex;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _pointColInd_type;
  _pointColInd_type pointColInd;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _pointRange_type;
  _pointRange_type pointRange;

   typedef int64_t _imuAvailable_type;
  _imuAvailable_type imuAvailable;

   typedef int64_t _odomAvailable_type;
  _odomAvailable_type odomAvailable;

   typedef float _imuRollInit_type;
  _imuRollInit_type imuRollInit;

   typedef float _imuPitchInit_type;
  _imuPitchInit_type imuPitchInit;

   typedef float _imuYawInit_type;
  _imuYawInit_type imuYawInit;

   typedef float _initialGuessX_type;
  _initialGuessX_type initialGuessX;

   typedef float _initialGuessY_type;
  _initialGuessY_type initialGuessY;

   typedef float _initialGuessZ_type;
  _initialGuessZ_type initialGuessZ;

   typedef float _initialGuessRoll_type;
  _initialGuessRoll_type initialGuessRoll;

   typedef float _initialGuessPitch_type;
  _initialGuessPitch_type initialGuessPitch;

   typedef float _initialGuessYaw_type;
  _initialGuessYaw_type initialGuessYaw;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _cloud_deskewed_type;
  _cloud_deskewed_type cloud_deskewed;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _cloud_corner_type;
  _cloud_corner_type cloud_corner;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _cloud_surface_type;
  _cloud_surface_type cloud_surface;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _key_frame_cloud_type;
  _key_frame_cloud_type key_frame_cloud;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _key_frame_color_type;
  _key_frame_color_type key_frame_color;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _key_frame_poses_type;
  _key_frame_poses_type key_frame_poses;

   typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _key_frame_map_type;
  _key_frame_map_type key_frame_map;





  typedef boost::shared_ptr< ::lio_sam::cloud_info_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lio_sam::cloud_info_<ContainerAllocator> const> ConstPtr;

}; // struct cloud_info_

typedef ::lio_sam::cloud_info_<std::allocator<void> > cloud_info;

typedef boost::shared_ptr< ::lio_sam::cloud_info > cloud_infoPtr;
typedef boost::shared_ptr< ::lio_sam::cloud_info const> cloud_infoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lio_sam::cloud_info_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lio_sam::cloud_info_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::lio_sam::cloud_info_<ContainerAllocator1> & lhs, const ::lio_sam::cloud_info_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.startRingIndex == rhs.startRingIndex &&
    lhs.endRingIndex == rhs.endRingIndex &&
    lhs.pointColInd == rhs.pointColInd &&
    lhs.pointRange == rhs.pointRange &&
    lhs.imuAvailable == rhs.imuAvailable &&
    lhs.odomAvailable == rhs.odomAvailable &&
    lhs.imuRollInit == rhs.imuRollInit &&
    lhs.imuPitchInit == rhs.imuPitchInit &&
    lhs.imuYawInit == rhs.imuYawInit &&
    lhs.initialGuessX == rhs.initialGuessX &&
    lhs.initialGuessY == rhs.initialGuessY &&
    lhs.initialGuessZ == rhs.initialGuessZ &&
    lhs.initialGuessRoll == rhs.initialGuessRoll &&
    lhs.initialGuessPitch == rhs.initialGuessPitch &&
    lhs.initialGuessYaw == rhs.initialGuessYaw &&
    lhs.cloud_deskewed == rhs.cloud_deskewed &&
    lhs.cloud_corner == rhs.cloud_corner &&
    lhs.cloud_surface == rhs.cloud_surface &&
    lhs.key_frame_cloud == rhs.key_frame_cloud &&
    lhs.key_frame_color == rhs.key_frame_color &&
    lhs.key_frame_poses == rhs.key_frame_poses &&
    lhs.key_frame_map == rhs.key_frame_map;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::lio_sam::cloud_info_<ContainerAllocator1> & lhs, const ::lio_sam::cloud_info_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace lio_sam

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::lio_sam::cloud_info_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lio_sam::cloud_info_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lio_sam::cloud_info_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lio_sam::cloud_info_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lio_sam::cloud_info_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lio_sam::cloud_info_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lio_sam::cloud_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b654dbfca2e5288eff9e25937cb8519e";
  }

  static const char* value(const ::lio_sam::cloud_info_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb654dbfca2e5288eULL;
  static const uint64_t static_value2 = 0xff9e25937cb8519eULL;
};

template<class ContainerAllocator>
struct DataType< ::lio_sam::cloud_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lio_sam/cloud_info";
  }

  static const char* value(const ::lio_sam::cloud_info_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lio_sam::cloud_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Cloud Info\n"
"Header header \n"
"\n"
"int32[] startRingIndex\n"
"int32[] endRingIndex\n"
"\n"
"int32[]  pointColInd # point column index in range image\n"
"float32[] pointRange # point range \n"
"\n"
"int64 imuAvailable\n"
"int64 odomAvailable\n"
"\n"
"# Attitude for LOAM initialization\n"
"float32 imuRollInit\n"
"float32 imuPitchInit\n"
"float32 imuYawInit\n"
"\n"
"# Initial guess from imu pre-integration\n"
"float32 initialGuessX\n"
"float32 initialGuessY\n"
"float32 initialGuessZ\n"
"float32 initialGuessRoll\n"
"float32 initialGuessPitch\n"
"float32 initialGuessYaw\n"
"\n"
"# Point cloud messages\n"
"sensor_msgs/PointCloud2 cloud_deskewed  # original cloud deskewed\n"
"sensor_msgs/PointCloud2 cloud_corner    # extracted corner feature\n"
"sensor_msgs/PointCloud2 cloud_surface   # extracted surface feature\n"
"\n"
"# 3rd party messages\n"
"sensor_msgs/PointCloud2 key_frame_cloud\n"
"sensor_msgs/PointCloud2 key_frame_color\n"
"sensor_msgs/PointCloud2 key_frame_poses\n"
"sensor_msgs/PointCloud2 key_frame_map\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/PointCloud2\n"
"# This message holds a collection of N-dimensional points, which may\n"
"# contain additional information such as normals, intensity, etc. The\n"
"# point data is stored as a binary blob, its layout described by the\n"
"# contents of the \"fields\" array.\n"
"\n"
"# The point cloud data may be organized 2d (image-like) or 1d\n"
"# (unordered). Point clouds organized as 2d images may be produced by\n"
"# camera depth sensors such as stereo or time-of-flight.\n"
"\n"
"# Time of sensor data acquisition, and the coordinate frame ID (for 3d\n"
"# points).\n"
"Header header\n"
"\n"
"# 2D structure of the point cloud. If the cloud is unordered, height is\n"
"# 1 and width is the length of the point cloud.\n"
"uint32 height\n"
"uint32 width\n"
"\n"
"# Describes the channels and their layout in the binary data blob.\n"
"PointField[] fields\n"
"\n"
"bool    is_bigendian # Is this data bigendian?\n"
"uint32  point_step   # Length of a point in bytes\n"
"uint32  row_step     # Length of a row in bytes\n"
"uint8[] data         # Actual point data, size is (row_step*height)\n"
"\n"
"bool is_dense        # True if there are no invalid points\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/PointField\n"
"# This message holds the description of one point entry in the\n"
"# PointCloud2 message format.\n"
"uint8 INT8    = 1\n"
"uint8 UINT8   = 2\n"
"uint8 INT16   = 3\n"
"uint8 UINT16  = 4\n"
"uint8 INT32   = 5\n"
"uint8 UINT32  = 6\n"
"uint8 FLOAT32 = 7\n"
"uint8 FLOAT64 = 8\n"
"\n"
"string name      # Name of field\n"
"uint32 offset    # Offset from start of point struct\n"
"uint8  datatype  # Datatype enumeration, see above\n"
"uint32 count     # How many elements in the field\n"
;
  }

  static const char* value(const ::lio_sam::cloud_info_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lio_sam::cloud_info_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.startRingIndex);
      stream.next(m.endRingIndex);
      stream.next(m.pointColInd);
      stream.next(m.pointRange);
      stream.next(m.imuAvailable);
      stream.next(m.odomAvailable);
      stream.next(m.imuRollInit);
      stream.next(m.imuPitchInit);
      stream.next(m.imuYawInit);
      stream.next(m.initialGuessX);
      stream.next(m.initialGuessY);
      stream.next(m.initialGuessZ);
      stream.next(m.initialGuessRoll);
      stream.next(m.initialGuessPitch);
      stream.next(m.initialGuessYaw);
      stream.next(m.cloud_deskewed);
      stream.next(m.cloud_corner);
      stream.next(m.cloud_surface);
      stream.next(m.key_frame_cloud);
      stream.next(m.key_frame_color);
      stream.next(m.key_frame_poses);
      stream.next(m.key_frame_map);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct cloud_info_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lio_sam::cloud_info_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lio_sam::cloud_info_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "startRingIndex[]" << std::endl;
    for (size_t i = 0; i < v.startRingIndex.size(); ++i)
    {
      s << indent << "  startRingIndex[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.startRingIndex[i]);
    }
    s << indent << "endRingIndex[]" << std::endl;
    for (size_t i = 0; i < v.endRingIndex.size(); ++i)
    {
      s << indent << "  endRingIndex[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.endRingIndex[i]);
    }
    s << indent << "pointColInd[]" << std::endl;
    for (size_t i = 0; i < v.pointColInd.size(); ++i)
    {
      s << indent << "  pointColInd[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.pointColInd[i]);
    }
    s << indent << "pointRange[]" << std::endl;
    for (size_t i = 0; i < v.pointRange.size(); ++i)
    {
      s << indent << "  pointRange[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.pointRange[i]);
    }
    s << indent << "imuAvailable: ";
    Printer<int64_t>::stream(s, indent + "  ", v.imuAvailable);
    s << indent << "odomAvailable: ";
    Printer<int64_t>::stream(s, indent + "  ", v.odomAvailable);
    s << indent << "imuRollInit: ";
    Printer<float>::stream(s, indent + "  ", v.imuRollInit);
    s << indent << "imuPitchInit: ";
    Printer<float>::stream(s, indent + "  ", v.imuPitchInit);
    s << indent << "imuYawInit: ";
    Printer<float>::stream(s, indent + "  ", v.imuYawInit);
    s << indent << "initialGuessX: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessX);
    s << indent << "initialGuessY: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessY);
    s << indent << "initialGuessZ: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessZ);
    s << indent << "initialGuessRoll: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessRoll);
    s << indent << "initialGuessPitch: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessPitch);
    s << indent << "initialGuessYaw: ";
    Printer<float>::stream(s, indent + "  ", v.initialGuessYaw);
    s << indent << "cloud_deskewed: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.cloud_deskewed);
    s << indent << "cloud_corner: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.cloud_corner);
    s << indent << "cloud_surface: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.cloud_surface);
    s << indent << "key_frame_cloud: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.key_frame_cloud);
    s << indent << "key_frame_color: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.key_frame_color);
    s << indent << "key_frame_poses: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.key_frame_poses);
    s << indent << "key_frame_map: ";
    s << std::endl;
    Printer< ::sensor_msgs::PointCloud2_<ContainerAllocator> >::stream(s, indent + "  ", v.key_frame_map);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LIO_SAM_MESSAGE_CLOUD_INFO_H
