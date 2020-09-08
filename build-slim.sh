#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.10.0 \
  -t mhart/alpine-node:slim-14.10 \
  -t mhart/alpine-node:slim-14 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
