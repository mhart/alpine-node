#/bin/sh

for tag in 10.20.1 10.20 10 slim-10.20.1 slim-10.20 slim-10; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
