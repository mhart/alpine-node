#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.16.1 \
  -t mhart/alpine-node:slim-14.16 \
  -t mhart/alpine-node:slim-14 \
  -f slim.dockerfile .
