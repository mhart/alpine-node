#/bin/sh

for tag in 16.4.2 16.4 16 slim-16.4.2 slim-16.4 slim-16 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
