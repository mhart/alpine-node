#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-15.4.0 \
  -t mhart/alpine-node:slim-15.4 \
  -t mhart/alpine-node:slim-15 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
