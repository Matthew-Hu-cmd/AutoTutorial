#include "ros/ros.h"
/*
    需求：设置机器人的共享参数，类型和半径（0.15），再修改半径为0.2
*/
int main(int argc, char *argv[])
{
    ros::init(argc,argv,"set_para_c");
    ros::NodeHandle nh;
    //-----------------Add param-----------------------
    //Add param via nodehandler
    nh.setParam("type","XiaoHuang");//("键",值)
    nh.setParam("radius",0.15);
    //Add param via ros::param
    ros::param::set("type_param","XiaoBai");
    ros::param::set("radius_param",0.15);
    //-----------------Revise param-------------------
    //via nodehandler
    nh.setParam("radius",0.2);
    //via ros::param
    ros::param::set("radius",0.25);
    return 0;
}
