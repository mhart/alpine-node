#/bin/sh

for tag in 13.6.0 13.6 13 latest slim-13.6.0 slim-13.6 slim-13 slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
