#/bin/sh

for tag in 14.15.5 14.15 14 slim-14.15.5 slim-14.15 slim-14; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
