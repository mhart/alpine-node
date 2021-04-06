#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.16.1 \
  -t mhart/alpine-node:14.16 \
  -t mhart/alpine-node:14 \
  -f tools.dockerfile .
