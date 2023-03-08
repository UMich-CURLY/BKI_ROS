// Generated by gencpp from file scene_understanding/MapHeader.msg
// DO NOT EDIT!


#ifndef SCENE_UNDERSTANDING_MESSAGE_MAPHEADER_H
#define SCENE_UNDERSTANDING_MESSAGE_MAPHEADER_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace scene_understanding
{
template <class ContainerAllocator>
struct MapHeader_
{
  typedef MapHeader_<ContainerAllocator> Type;

  MapHeader_()
    : header()
    , originx(0.0)
    , originy(0.0)
    , num_rows(0)
    , num_cols(0)
    , cell_size(0.0)  {
    }
  MapHeader_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , originx(0.0)
    , originy(0.0)
    , num_rows(0)
    , num_cols(0)
    , cell_size(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _originx_type;
  _originx_type originx;

   typedef double _originy_type;
  _originy_type originy;

   typedef int32_t _num_rows_type;
  _num_rows_type num_rows;

   typedef int32_t _num_cols_type;
  _num_cols_type num_cols;

   typedef double _cell_size_type;
  _cell_size_type cell_size;





  typedef boost::shared_ptr< ::scene_understanding::MapHeader_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::scene_understanding::MapHeader_<ContainerAllocator> const> ConstPtr;

}; // struct MapHeader_

typedef ::scene_understanding::MapHeader_<std::allocator<void> > MapHeader;

typedef boost::shared_ptr< ::scene_understanding::MapHeader > MapHeaderPtr;
typedef boost::shared_ptr< ::scene_understanding::MapHeader const> MapHeaderConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::scene_understanding::MapHeader_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::scene_understanding::MapHeader_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::scene_understanding::MapHeader_<ContainerAllocator1> & lhs, const ::scene_understanding::MapHeader_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.originx == rhs.originx &&
    lhs.originy == rhs.originy &&
    lhs.num_rows == rhs.num_rows &&
    lhs.num_cols == rhs.num_cols &&
    lhs.cell_size == rhs.cell_size;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::scene_understanding::MapHeader_<ContainerAllocator1> & lhs, const ::scene_understanding::MapHeader_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace scene_understanding

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::MapHeader_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::MapHeader_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::MapHeader_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::MapHeader_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::MapHeader_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::MapHeader_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::scene_understanding::MapHeader_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3f32797868801a9f5a26fc67434cd215";
  }

  static const char* value(const ::scene_understanding::MapHeader_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3f32797868801a9fULL;
  static const uint64_t static_value2 = 0x5a26fc67434cd215ULL;
};

template<class ContainerAllocator>
struct DataType< ::scene_understanding::MapHeader_<ContainerAllocator> >
{
  static const char* value()
  {
    return "scene_understanding/MapHeader";
  }

  static const char* value(const ::scene_understanding::MapHeader_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::scene_understanding::MapHeader_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"float64 originx\n"
"float64 originy\n"
"\n"
"int32 num_rows\n"
"int32 num_cols\n"
"float64 cell_size\n"
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
;
  }

  static const char* value(const ::scene_understanding::MapHeader_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::scene_understanding::MapHeader_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.originx);
      stream.next(m.originy);
      stream.next(m.num_rows);
      stream.next(m.num_cols);
      stream.next(m.cell_size);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MapHeader_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::scene_understanding::MapHeader_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::scene_understanding::MapHeader_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "originx: ";
    Printer<double>::stream(s, indent + "  ", v.originx);
    s << indent << "originy: ";
    Printer<double>::stream(s, indent + "  ", v.originy);
    s << indent << "num_rows: ";
    Printer<int32_t>::stream(s, indent + "  ", v.num_rows);
    s << indent << "num_cols: ";
    Printer<int32_t>::stream(s, indent + "  ", v.num_cols);
    s << indent << "cell_size: ";
    Printer<double>::stream(s, indent + "  ", v.cell_size);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SCENE_UNDERSTANDING_MESSAGE_MAPHEADER_H