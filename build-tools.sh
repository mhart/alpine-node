#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.14.0 \
  -t mhart/alpine-node:15.14 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
