#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim \
  -t mhart/alpine-node:slim-13.6.0 \
  -t mhart/alpine-node:slim-13.6 \
  -t mhart/alpine-node:slim-13 \
  -f slim.dockerfile .
