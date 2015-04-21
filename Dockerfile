#FROM mhart/alpine-node-base:0.10
FROM mhart/alpine-node-base:0.12
#FROM mhart/alpine-iojs-base:latest

RUN cd /tmp && \
  url=$(wget -O - http://registry.npmjs.org/npm/latest 2> /dev/null | sed -e 's/^.*tarball":"//' | sed -e 's/".*$//') && \
  wget -O - "$url" | tar -xzf - && \
  cd package && \
  node cli.js install -gf && \
  cd / && \
  rm -rf /tmp/* /root/.npm /root/.node-gyp \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
