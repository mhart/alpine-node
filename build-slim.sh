#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-10.22.1 \
  -t mhart/alpine-node:slim-10.22 \
  -t mhart/alpine-node:slim-10 \
  -f slim.dockerfile .
