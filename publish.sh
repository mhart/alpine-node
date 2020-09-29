#/bin/sh

for tag in 14.13.0 14.13 14 slim-14.13.0 slim-14.13 slim-14 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
