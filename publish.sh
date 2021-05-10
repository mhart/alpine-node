#/bin/sh

for tag in 16.1.0 16.1 16 slim-16.1.0 slim-16.1 slim-16 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
