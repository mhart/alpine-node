#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.22.0 \
  -t mhart/alpine-node:slim-12.22 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
