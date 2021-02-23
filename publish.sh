#/bin/sh

for tag in 15.10.0 15.10 15 slim-15.10.0 slim-15.10 slim-15 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
