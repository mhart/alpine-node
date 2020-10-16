#/bin/sh

for tag in 14.14.0 14.14 14 slim-14.14.0 slim-14.14 slim-14 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
