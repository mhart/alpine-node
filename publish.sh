#/bin/sh

for tag in 13.12.0 13.12 13 slim-13.12.0 slim-13.12 slim-13 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
