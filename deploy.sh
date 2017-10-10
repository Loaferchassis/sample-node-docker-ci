#!/bin/bash
docker push alexanderd/sample-node

ssh deploy@35.187.30.81
docker pull alexanded/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi alexanded/sample-node:current || true
docker tag alexanderd/sample-node:latest alexanderd/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 alexanderd/sample-node:current

