#/bin/sh

for tag in 12.18.0 12.18 12 slim-12.18.0 slim-12.18 slim-12; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
