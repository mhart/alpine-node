#/bin/sh

for tag in 13.7.0 13.7 13 latest slim-13.7.0 slim-13.7 slim-13 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
