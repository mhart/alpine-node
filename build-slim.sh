#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.22.1 \
  -t mhart/alpine-node:slim-12.22 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
