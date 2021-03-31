#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-15.13.0 \
  -t mhart/alpine-node:slim-15.13 \
  -t mhart/alpine-node:slim-15 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
