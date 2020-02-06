#/bin/sh

for tag in 13.8.0 13.8 13 latest slim-13.8.0 slim-13.8 slim-13 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
