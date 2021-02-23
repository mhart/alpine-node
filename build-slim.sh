#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-15.10.0 \
  -t mhart/alpine-node:slim-15.10 \
  -t mhart/alpine-node:slim-15 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
