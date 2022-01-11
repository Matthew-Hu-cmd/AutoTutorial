#include "plumbing_head_src/hello.h"
#include "ros/ros.h"

namespace hello_ns 
{
    void MyHello::run()
    {
        ROS_INFO("源文件中的run函数....");
    }
}