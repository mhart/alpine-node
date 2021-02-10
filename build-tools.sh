#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:10.23.3 \
  -t mhart/alpine-node:10.23 \
  -t mhart/alpine-node:10 \
  -f tools.dockerfile .
