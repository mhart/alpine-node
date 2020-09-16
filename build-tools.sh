#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:12.18.4 \
  -t mhart/alpine-node:12.18 \
  -t mhart/alpine-node:12 \
  -f tools.dockerfile .
