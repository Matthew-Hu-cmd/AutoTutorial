#include "ros/ros.h"
/*
    需求1：ros中跟时刻有关的操作
    实现：
        1.准备（头文件 节点初始化 nodehandle）
        2.获取当前时刻
        3.设置指定时刻
    
    需求2： 程序中停顿5s******************************************很重要
    实现： 
        1.创建时间持续对象
        2.让其停顿一段时间
    需求3： 已知程序开始运行的时刻和程序运行的时间，求运行结束的时刻
    实现：
        1.获取开始执行的时刻
        2.模拟运行时间（N秒）
        3.计算结束时刻
    需求4： 每隔一秒钟在控制台输出一段文本
    实现：
        策略1：ros：：rate（1）
        策略2：利用定时器
*/



//callback function
void cb(const ros::TimerEvent& event)
{
    ROS_INFO("callback function");
    ROS_INFO("函数被调用的时刻：%.2f",event.current_real.toSec());
}





// int main(int argc, char const *argv[])
int main(int argc, char *argv[]) //如果是constant的argv则会报错
{
    //准备
    setlocale(LC_ALL,"");
    ros::init(argc, argv, "hello_time");
    ros::NodeHandle nh; //会初始化ros的时间操作,所有的ROS API都需要先使用节点句柄

    //2.获取当前时刻
        //当前时刻：now函数被执行的那一刻
        //参考系1970.1.1 8：00
    ros::Time right_now = ros::Time::now();
    ROS_INFO("当前时刻:%.2f",right_now.toSec());
    ROS_INFO("当前时刻:%d",right_now.sec);      // 留意两者不同之处

    //3.设置指定时刻
    ros::Time t1(20.31214325346);
    ros::Time t2(100.35);
    ROS_INFO("t1 = %.2f",t1.toSec());
    ROS_INFO("t2 = %.2f",t2.toSec());

//-------------------------------------------------------------------
    ROS_INFO("---------------持续时间-------------------");
    ros::Time start = ros::Time::now();
    ROS_INFO("开始休眠：%.2f",start.toSec());

    //核心

    ros::Duration du(1.5);
    du.sleep();// 休眠
    

    ros::Time end = ros::Time::now();
    ROS_INFO("休眠结束：%.2f",end.toSec());
//----------------------------------------------------------------------
    ROS_INFO("---------------时间运算-------------------");
    //1.获取开始执行的时刻
    ros::Time begin = ros::Time::now();
    //2.模拟运行时间（N秒）
    ros::Duration du1(5);
    //3.计算结束时刻
    ros::Time stop =begin + du1;
    ROS_INFO("开始时间：%.2f",begin.toSec());
    ROS_INFO("结束时间：%.2f",stop.toSec());

    //时刻与时刻之间的运算
    //ros::Time sum = begin + stop; 时刻之间不能相加
    ros::Duration du2 = stop - begin;               //时间相减得到的是持续时间
    ROS_INFO("du2 = stop - begin = %.2f",du2.toSec());
    //持续时间与持续时间运算 这个是完全没问题的
    ros::Duration du3 = du1 + du2;
    ROS_INFO("du3 = du1 + du2 = %.2f",du3.toSec());

    ROS_INFO("---------------定时器延时-------------------");
                        // ros::Rate rate(1);//指定频率
                        // while (true)
                        // {
                        //     ROS_INFO("-----------code----------");
                        //     rate.sleep();//休眠，休眠时间 = 1 / 频率。
                        // }

    /*
   * \brief Create a timer which will call a callback at the specified rate.  This variant takes
   * a class member function, and a bare pointer to the object to call the method on.
   *
   * When the Timer (and all copies of it) returned goes out of scope, the timer will automatically
   * be stopped, and the callback will no longer be called.
   *
   * \param period The period at which to call the callback
   * \param callback The method to call
   * \param obj The object to call the method on
   * \param oneshot If true, this timer will only fire once
   * \param autostart If true (default), return timer that is already started
   
   ros::Timer createTimer(ros::Duration period,  时间间隔
                            const ros::TimerCallback &callback, 用来封装业务的回调函数 
                            bool oneshot = false,  是否是一次性
                            bool autostart = true) const   自动启动
   */

    // ros::Timer timer = nh.createTimer(ros::Duration(1),cb); //创建定时器是timer类型不是time类型！！！
    // ros::Timer timer = nh.createTimer(ros::Duration(1),cb,true); //只执行一次回调
    ros::Timer timer = nh.createTimer(ros::Duration(1),cb,false,false); //不能自启动
    timer.start();
    ros::spin();//需要回旋

    return 0;

}
