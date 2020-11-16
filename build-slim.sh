#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.19.1 \
  -t mhart/alpine-node:slim-12.19 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
