#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-15.12.0 \
  -t mhart/alpine-node:slim-15.12 \
  -t mhart/alpine-node:slim-15 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
