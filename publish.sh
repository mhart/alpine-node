#/bin/sh

for tag in 16.2.0 16.2 16 slim-16.2.0 slim-16.2 slim-16 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
