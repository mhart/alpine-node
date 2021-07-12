#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-16.4.2 \
  -t mhart/alpine-node:slim-16.4 \
  -t mhart/alpine-node:slim-16 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
