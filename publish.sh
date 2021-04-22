#/bin/sh

for tag in 16.0.0 16.0 16 slim-16.0.0 slim-16.0 slim-16 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
