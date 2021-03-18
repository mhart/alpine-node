#/bin/sh

for tag in 15.12.0 15.12 15 slim-15.12.0 slim-15.12 slim-15 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
