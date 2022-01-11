#include "ros/ros.h"
#include "plumbing_head_src/hello.h"

//目标是将该文件与hello.cpp进行链接，在cmakelist中进行

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc, argv,"hello_head_src");

    hello_ns::MyHello myHello;
    myHello.run();

    return 0;
}
