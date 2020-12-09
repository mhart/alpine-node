#/bin/sh

for tag in 15.4.0 15.4 15 slim-15.4.0 slim-15.4 slim-15 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
