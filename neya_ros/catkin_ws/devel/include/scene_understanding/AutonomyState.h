// Generated by gencpp from file scene_understanding/AutonomyState.msg
// DO NOT EDIT!


#ifndef SCENE_UNDERSTANDING_MESSAGE_AUTONOMYSTATE_H
#define SCENE_UNDERSTANDING_MESSAGE_AUTONOMYSTATE_H


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
struct AutonomyState_
{
  typedef AutonomyState_<ContainerAllocator> Type;

  AutonomyState_()
    : state(0)  {
    }
  AutonomyState_(const ContainerAllocator& _alloc)
    : state(0)  {
  (void)_alloc;
    }



   typedef int8_t _state_type;
  _state_type state;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(DISABLE_AUTONOMY)
  #undef DISABLE_AUTONOMY
#endif
#if defined(_WIN32) && defined(ENABLE_AUTONOMY)
  #undef ENABLE_AUTONOMY
#endif
#if defined(_WIN32) && defined(ENABLE_AUTONOMY_HYBRID)
  #undef ENABLE_AUTONOMY_HYBRID
#endif

  enum {
    DISABLE_AUTONOMY = 0,
    ENABLE_AUTONOMY = 1,
    ENABLE_AUTONOMY_HYBRID = 2,
  };


  typedef boost::shared_ptr< ::scene_understanding::AutonomyState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::scene_understanding::AutonomyState_<ContainerAllocator> const> ConstPtr;

}; // struct AutonomyState_

typedef ::scene_understanding::AutonomyState_<std::allocator<void> > AutonomyState;

typedef boost::shared_ptr< ::scene_understanding::AutonomyState > AutonomyStatePtr;
typedef boost::shared_ptr< ::scene_understanding::AutonomyState const> AutonomyStateConstPtr;

// constants requiring out of line definition

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::scene_understanding::AutonomyState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::scene_understanding::AutonomyState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::scene_understanding::AutonomyState_<ContainerAllocator1> & lhs, const ::scene_understanding::AutonomyState_<ContainerAllocator2> & rhs)
{
  return lhs.state == rhs.state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::scene_understanding::AutonomyState_<ContainerAllocator1> & lhs, const ::scene_understanding::AutonomyState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace scene_understanding

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::AutonomyState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::scene_understanding::AutonomyState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::AutonomyState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::scene_understanding::AutonomyState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::AutonomyState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::scene_understanding::AutonomyState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::scene_understanding::AutonomyState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "360e23629954382a9bc44f0eb38bc373";
  }

  static const char* value(const ::scene_understanding::AutonomyState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x360e23629954382aULL;
  static const uint64_t static_value2 = 0x9bc44f0eb38bc373ULL;
};

template<class ContainerAllocator>
struct DataType< ::scene_understanding::AutonomyState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "scene_understanding/AutonomyState";
  }

  static const char* value(const ::scene_understanding::AutonomyState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::scene_understanding::AutonomyState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Autonomy States\n"
"# Note: This message is used to transition between autonomy states on the MRZR.\n"
"# Note: Hybrid mode is not recommended in most cases.\n"
"int8 DISABLE_AUTONOMY=0\n"
"int8 ENABLE_AUTONOMY=1\n"
"int8 ENABLE_AUTONOMY_HYBRID=2\n"
"\n"
"int8 state\n"
;
  }

  static const char* value(const ::scene_understanding::AutonomyState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::scene_understanding::AutonomyState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AutonomyState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::scene_understanding::AutonomyState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::scene_understanding::AutonomyState_<ContainerAllocator>& v)
  {
    s << indent << "state: ";
    Printer<int8_t>::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SCENE_UNDERSTANDING_MESSAGE_AUTONOMYSTATE_H