#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-10.20.0 \
  -t mhart/alpine-node:slim-10.20 \
  -t mhart/alpine-node:slim-10 \
  -f slim.dockerfile .
