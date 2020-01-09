#/bin/sh

docker build --squash \
  -t mhart/alpine-node:slim-10.18.1 \
  -t mhart/alpine-node:slim-10.18 \
  -t mhart/alpine-node:slim-10 \
  -f slim.dockerfile .
