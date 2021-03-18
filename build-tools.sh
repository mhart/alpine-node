#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.12.0 \
  -t mhart/alpine-node:15.12 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
