#/bin/sh

docker build --squash \
  -t mhart/alpine-node:12.16.0 \
  -t mhart/alpine-node:12.16 \
  -t mhart/alpine-node:12 \
  -f tools.dockerfile .
