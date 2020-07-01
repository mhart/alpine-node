#/bin/sh

for tag in 14.5.0 14.5 14 slim-14.5.0 slim-14.5 slim-14 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
