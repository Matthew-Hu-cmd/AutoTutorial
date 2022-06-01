#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect("127.0.0.1",1234)
    s.sendall(b"Hello,Matthew!")#发送的是一个字节序列，并不是字符串，一定要加b
    data = s.recv(1024)
    print("Received:", repr(data))
    