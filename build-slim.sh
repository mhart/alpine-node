#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-16.0.0 \
  -t mhart/alpine-node:slim-16.0 \
  -t mhart/alpine-node:slim-16 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
