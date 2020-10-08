#/bin/sh

for tag in 14.13.1 14.13 14 slim-14.13.1 slim-14.13 slim-14 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
