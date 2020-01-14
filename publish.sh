#/bin/sh

for tag in 8.17.0 8.17 8 slim-8.17.0 slim-8.17 slim-8; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
