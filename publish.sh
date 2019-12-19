#/bin/sh

for tag in latest 13.5.0 13.5 13 slim slim-13.5.0 slim-13.5 slim-13; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done
