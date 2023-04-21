// Generated by gencpp from file scene_understanding/LoggerControl.msg
// DO NOT EDIT!


#ifndef SCENE_UNDERSTANDING_MESSAGE_LOGGERCONTROL_H
#define SCENE_UNDERSTANDING_MESSAGE_LOGGERCONTROL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace scene_understanding
{
template <class ContainerAllocator>
struct LoggerControl_
{
  typedef LoggerControl_<ContainerAllocator> Type;

  LoggerControl_()
    : directory()
    , experiment()
    , log_data(false)  {
    }
  LoggerControl_(const ContainerAllocator& _alloc)
    : directory(_alloc)
    , experiment(_alloc)
    , log_data(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _directory_type;
  _directory_type directory;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _experiment_type;
  _experiment_type experiment;

   typedef uint8_t _log_data_type;
  _log_data_type log_data;





  typedef boost::shared_ptr< ::scene_understanding::LoggerControl_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::scene_understanding::LoggerControl_<ContainerAllocator> const> ConstPtr;

}; // struct LoggerControl_

typedef ::scene_understanding::LoggerControl_<std::allocator<void> > LoggerControl;

typedef boost::shared_ptr< ::scene_understanding::LoggerControl > LoggerControlPtr;
typedef boost::shared_ptr< ::scene_understanding::LoggerControl const> LoggerControlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::scene_understanding::LoggerControl_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::scene_understanding::LoggerControl_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::scene_understanding::LoggerControl_<ContainerAllocator1> & lhs, const ::scene_understanding::LoggerControl_<ContainerAllocator2> & rhs)
{
  return lhs.directory == rhs.directory &&
    lhs.experiment == rhs.experiment &&
    lhs.log_data == rhs.log_data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::scene_understanding::LoggerControl_<ContainerAllocator1> & lhs, const ::scene_understanding::LoggerControl_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace scene_understanding

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::LoggerControl_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::LoggerControl_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::LoggerControl_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::LoggerControl_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::LoggerControl_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::LoggerControl_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::scene_understanding::LoggerControl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c6ce9bb3e388aa19d3b944e0c92c892a";
  }

  static const char* value(const ::scene_understanding::LoggerControl_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc6ce9bb3e388aa19ULL;
  static const uint64_t static_value2 = 0xd3b944e0c92c892aULL;
};

template<class ContainerAllocator>
struct DataType< ::scene_understanding::LoggerControl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "scene_understanding/LoggerControl";
  }

  static const char* value(const ::scene_understanding::LoggerControl_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::scene_understanding::LoggerControl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string directory\n"
"string experiment\n"
"bool log_data\n"
;
  }

  static const char* value(const ::scene_understanding::LoggerControl_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::scene_understanding::LoggerControl_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.directory);
      stream.next(m.experiment);
      stream.next(m.log_data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LoggerControl_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::scene_understanding::LoggerControl_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::scene_understanding::LoggerControl_<ContainerAllocator>& v)
  {
    s << indent << "directory: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.directory);
    s << indent << "experiment: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.experiment);
    s << indent << "log_data: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.log_data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SCENE_UNDERSTANDING_MESSAGE_LOGGERCONTROL_H