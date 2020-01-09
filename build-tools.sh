#/bin/sh

docker build --squash \
  -t mhart/alpine-node:10.18.1 \
  -t mhart/alpine-node:10.18 \
  -t mhart/alpine-node:10 \
  -f tools.dockerfile .
