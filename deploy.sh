#!/bin/bash
docker push alexanderd/sample-node

ssh loaferchassis@35.195.183.2 <<EOF
docker pull alexanderd/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi alexanderd/sample-node:current || true
docker tag alexanderd/sample-node:latest alexanderd/sample-node:current
docker run -d --restart always --name web -p 80:80 alexanderd/sample-node:current
EOF
