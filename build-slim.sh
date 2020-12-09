#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-8.17.0 \
  -t mhart/alpine-node:slim-8.17 \
  -t mhart/alpine-node:slim-8 \
  -f slim.dockerfile .
