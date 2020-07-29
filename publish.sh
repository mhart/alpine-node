#/bin/sh

for tag in 14.7.0 14.7 14 slim-14.7.0 slim-14.7 slim-14 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
