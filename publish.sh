#/bin/sh

for tag in 14.17.3 14.17 14 slim-14.17.3 slim-14.17 slim-14; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
