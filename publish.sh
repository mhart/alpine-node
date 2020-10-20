#/bin/sh

for tag in 15.0.0 15.0 15 slim-15.0.0 slim-15.0 slim-15 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
