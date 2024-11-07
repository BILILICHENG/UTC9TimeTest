#!/bin/bash

utc9_time=$(TZ=Asia/Tokyo date +"%Y-%m-%d")

echo "$utc9_time" > utc9-time.txt
