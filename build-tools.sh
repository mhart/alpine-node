#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:16.1.0 \
  -t mhart/alpine-node:16.1 \
  -t mhart/alpine-node:16 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
