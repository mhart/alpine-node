#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.17.0 \
  -t mhart/alpine-node:slim-12.17 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
