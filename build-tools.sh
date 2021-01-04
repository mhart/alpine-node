#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:15.5.1 \
  -t mhart/alpine-node:15.5 \
  -t mhart/alpine-node:15 \
  -t mhart/alpine-node:latest \
  -f tools.dockerfile .
