#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-13.14.0 \
  -t mhart/alpine-node:slim-13.14 \
  -t mhart/alpine-node:slim-13 \
  -f slim.dockerfile .
