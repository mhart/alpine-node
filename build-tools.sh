#/bin/sh

docker build --pull --squash \
  -t mhart/alpine-node:14.15.5 \
  -t mhart/alpine-node:14.15 \
  -t mhart/alpine-node:14 \
  -f tools.dockerfile .
