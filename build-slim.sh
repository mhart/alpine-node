#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.15.0 \
  -t mhart/alpine-node:slim-12.15 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
