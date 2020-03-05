#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-13.10.1 \
  -t mhart/alpine-node:slim-13.10 \
  -t mhart/alpine-node:slim-13 \
  -t mhart/alpine-node:slim \
  -f slim.dockerfile .
