#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-13.7.0 \
  -t mhart/alpine-node:slim-13.7 \
  -t mhart/alpine-node:slim-13 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
