#/bin/sh

for tag in 13.10.1 13.10 13 slim-13.10.1 slim-13.10 slim-13 latest slim; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
