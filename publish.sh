#/bin/sh

for tag in 14.6.0 14.6 14 slim-14.6.0 slim-14.6 slim-14 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
