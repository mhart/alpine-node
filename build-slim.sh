#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.0.0 \
  -t mhart/alpine-node:slim-14.0 \
  -t mhart/alpine-node:slim-14 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
