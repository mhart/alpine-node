#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.22.3 \
  -t mhart/alpine-node:12.22 \
  -t mhart/alpine-node:12 \
  -f tools.dockerfile .
