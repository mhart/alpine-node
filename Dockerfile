#FROM mhart/alpine-node-base:0.10
FROM mhart/alpine-node-base:0.12
#FROM mhart/alpine-iojs-base:latest

RUN apk update && \
  apk add curl && \
  url=$(curl -SsL https://registry.npmjs.org/npm/latest | sed -e 's/^.*tarball":"//' | sed -e 's/".*$//') && \
  cd /tmp && \
  curl -sSL "$url" | tar -xzf - && \
  cd package && \
  node cli.js install -gf && \
  apk del curl && \
  cd / && \
  rm -rf /var/cache/apk/* /tmp/* /root/.npm \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
