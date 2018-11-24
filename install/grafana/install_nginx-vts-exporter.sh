#!/bin/bash

ip_addr=ip



wget https://github.com/hnlq715/nginx-vts-exporter/releases/download/v0.10.3/nginx-vts-exporter-0.10.3.linux-amd64.tar.gz -P /data/service/src

cd /data/service/src

tar xf  nginx-vts-exporter-0.10.3.linux-amd64.tar.gz -C /data/service

mv /data/service/nginx-vts-exporter-0.10.3.linux-amd64 /data/service/nginx-vts-exporter


mkdir -p  /data/service/nginx-vts-exporter/log

# 启动脚本
/data/service/nginx-vts-exporter/nginx-vts-exporter -nginx.scrape_timeout 10 -nginx.scrape_uri http://${ip_addr}/status/format/json  >> /data/service/nginx-vts-exporter/log/nginx-vts-exporter.log  2>&1 &


