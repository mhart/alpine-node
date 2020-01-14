#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.14.1 \
  -t mhart/alpine-node:slim-12.14 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
