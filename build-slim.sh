#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.13.0 \
  -t mhart/alpine-node:slim-14.13 \
  -t mhart/alpine-node:slim-14 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
