#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

int main(int argc, char *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"control");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("turtle1/cmd_vel",1000);
    geometry_msgs::Twist msg;
    msg.linear.x = 1;
    msg.linear.y = 0;
    msg.linear.z = 0;

    msg.angular.x = 0;
    msg.angular.y = 0;
    msg.angular.z = 2.0;

    ros::Rate(10);
    while (ros::ok())
    {
        pub.publish(msg);
        ros::spinOnce();
    }
    

    return 0;
}
