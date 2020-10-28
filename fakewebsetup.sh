#!/bin/sh

git clone https://github.com/umlaeute/v4l2loopback/
cd v4l2loopback/
make && sudo make install
sudo depmod -a 
