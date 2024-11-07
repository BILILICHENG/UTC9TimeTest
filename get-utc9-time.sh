#!/bin/bash

# 获取当前 UTC+9 时间
utc9_time=$(TZ=Asia/Tokyo date +"%Y-%m-%d %H:%M:%S")

# 将时间写入文件
echo "$utc9_time" > utc9-time.txt
