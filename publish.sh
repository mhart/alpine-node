#/bin/sh

for tag in 13.14.0 13.14 13 slim-13.14.0 slim-13.14 slim-13; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
