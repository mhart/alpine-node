#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-10.24.0 \
  -t mhart/alpine-node:slim-10.24 \
  -t mhart/alpine-node:slim-10 \
  -f slim.dockerfile .
