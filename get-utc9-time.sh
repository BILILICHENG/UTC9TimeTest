#!/bin/bash
 
# 获取当前UTC时间，并转换为UTC+9时间
utc_time=$(date -u +"%Y-%m-%d %H:%M:%S")
utc9_time=$(TZ=Asia/Tokyo date -d "$utc_time" +"%Y-%m-%d %H:%M:%S")
 
# 将时间写入文件
echo "$utc9_time" > utc9-time.txt
