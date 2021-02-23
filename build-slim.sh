#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.21.0 \
  -t mhart/alpine-node:slim-12.21 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
