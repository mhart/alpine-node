#/bin/sh

for tag in 12.19.0 12.19 12 slim-12.19.0 slim-12.19 slim-12; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
