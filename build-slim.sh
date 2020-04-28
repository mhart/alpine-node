#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-12.16.3 \
  -t mhart/alpine-node:slim-12.16 \
  -t mhart/alpine-node:slim-12 \
  -f slim.dockerfile .
