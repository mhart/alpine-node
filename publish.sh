#/bin/sh

for tag in 15.7.0 15.7 15 slim-15.7.0 slim-15.7 slim-15 slim latest; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
