#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-14.17.3 \
  -t mhart/alpine-node:slim-14.17 \
  -t mhart/alpine-node:slim-14 \
  -f slim.dockerfile .
