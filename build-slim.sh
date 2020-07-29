#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.7.0 \
  -t mhart/alpine-node:slim-14.7 \
  -t mhart/alpine-node:slim-14 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
