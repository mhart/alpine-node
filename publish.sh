#/bin/sh

git push

for tag in latest 13.6.0 13.6 13 slim slim-13.6.0 slim-13.6 slim-13; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done
