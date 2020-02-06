#/bin/sh

docker build --squash \
  -t mhart/alpine-node:10.19.0 \
  -t mhart/alpine-node:10.19 \
  -t mhart/alpine-node:10 \
  -f tools.dockerfile .
