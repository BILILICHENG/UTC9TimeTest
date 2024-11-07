#!/bin/bash

touch utc9-time.txt

utc9_time=$(TZ=Asia/Tokyo date +"%Y-%m-%d")

sed -i "1s/.*/$utc9_time/" utc9-time.txt
