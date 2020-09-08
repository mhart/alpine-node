#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.10.0 \
  -t mhart/alpine-node:14.10 \
  -t mhart/alpine-node:14 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
