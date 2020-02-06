#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-13.8.0 \
  -t mhart/alpine-node:slim-13.8 \
  -t mhart/alpine-node:slim-13 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
