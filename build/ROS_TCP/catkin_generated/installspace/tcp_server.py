#!/usr/bin/env python2
# -*- coding: utf-8 -*-
from json.tool import main
import socket
#代码作用：服务器实现，将接收到的数据原封不动地发送回客户端
#with 能实现当代码离开块的时候会调用s.close()来销毁socket
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s: #IPV4地址家族、TCP协议
    s.bind(("192.168.43.89", 1234)) #0.0.0.0代表主机上的任何一个网卡都能使用这个socket通信
    s.listen()                #设置为监听状态并等待客户端的连接
    c, addr = s.accept()     #接收到之后会返回一个新的socket C，以及客户端的IP地址
    #此处返回的c是与之前的s不同的socket
    #socket s 主要用于监听，c用于与连接的客户端进行通，此时，通信已经成功建立
    
    
    #开始处理请求
    with c:
        print(addr, "connected.")

        while True:
            data = c.recv(1024)#最大可以接受1024个字节的数据
            if not data:    #只要数据不为空就将数据原封不动的传回客户端
                break
            c.sendall(data)
            print(data.decode('utf-8'))

if __name__ == "__main__":
    main()

'''
    调试工具
    命令行中输入: nc 127.0.0.1
    使用netcat工具连接到本机的IP(127.0.0.1代表的回传IP)之后就可以用来测试服务器的代码
'''