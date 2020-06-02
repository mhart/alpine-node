#/bin/sh

for tag in 10.21.0 10.21 10 slim-10.21.0 slim-10.21 slim-10; do
  git tag -f $tag
  git push -f origin $tag
  docker push mhart/alpine-node:$tag
done

git push
