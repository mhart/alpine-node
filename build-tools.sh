#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.4.0 \
  -t mhart/alpine-node:14.4 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
