#/bin/sh

for tag in 15.9.0 15.9 15 slim-15.9.0 slim-15.9 slim-15 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
