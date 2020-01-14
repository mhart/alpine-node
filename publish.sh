#/bin/sh

for tag in 12.14.1 12.14 12 slim-12.14.1 slim-12.14 slim-12; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
