#/bin/sh

for tag in 14.4.0 14.4 14 latest slim-14.4.0 slim-14.4 slim-14 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
