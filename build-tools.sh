#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.10.0 \
  -t mhart/alpine-node:15.10 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
