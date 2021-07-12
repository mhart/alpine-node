#/bin/sh

for tag in 12.22.3 12.22 12 slim-12.22.3 slim-12.22 slim-12; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
