#/bin/sh

for tag in 14.12.0 14.12 14 slim-14.12.0 slim-14.12 slim-14 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
