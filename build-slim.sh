#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-10.21.0 \
  -t mhart/alpine-node:slim-10.21 \
  -t mhart/alpine-node:slim-10 \
  -f slim.dockerfile .
