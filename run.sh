#!/usr/bin/bash

docker run --name=nginx-img -it --rm -p 8881:80 -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf -v $(pwd)/img:/img -d nginx

