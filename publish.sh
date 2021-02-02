#/bin/sh

for tag in 15.8.0 15.8 15 slim-15.8.0 slim-15.8 slim-15 slim latest; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
