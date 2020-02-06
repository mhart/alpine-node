#/bin/sh

for tag in 10.19.0 10.19 10 slim-10.19.0 slim-10.19 slim-10; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
