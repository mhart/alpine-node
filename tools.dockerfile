# FROM mhart/alpine-node:8
# FROM alpine:3.6
# ENV NPM_VERSION=6 YARN_VERSION=v1.22.10

# FROM mhart/alpine-node:10
# FROM alpine:3.7
# ENV NPM_VERSION=6 YARN_VERSION=v1.22.10

FROM mhart/alpine-node:12
FROM alpine:3.9
ENV NPM_VERSION=6 YARN_VERSION=v1.22.10

# FROM mhart/alpine-node:14
# FROM alpine:3.11
# ENV NPM_VERSION=6 YARN_VERSION=v1.22.10

# FROM mhart/alpine-node:16
# FROM alpine:3.13
# ENV NPM_VERSION=7 YARN_VERSION=v1.22.10

COPY --from=0 /usr/bin/node /usr/bin/
COPY --from=0 /usr/lib/node_modules /tmp/node_modules
COPY --from=0 /usr/include/node /usr/include/node
COPY --from=0 /usr/share/systemtap/tapset/node.stp /usr/share/systemtap/tapset/

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl gnupg libstdc++
RUN /tmp/node_modules/npm/bin/npm-cli.js install -g npm@${NPM_VERSION} && \
  find /usr/lib/node_modules/npm -type d \( -name test -o -name .bin \) | xargs rm -rf
RUN for server in hkps://keys.openpgp.org ipv4.pool.sks-keyservers.net keyserver.pgp.com ha.pool.sks-keyservers.net; do \
    gpg --keyserver $server --recv-keys \
      6A010C5166006599AA17F08146C2130DFD2497F5 && break; \
  done
RUN curl -sfSL -O https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz -O https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz.asc && \
  gpg --batch --verify yarn-${YARN_VERSION}.tar.gz.asc yarn-${YARN_VERSION}.tar.gz && \
  rm -rf /usr/local/share/yarn && \
  mkdir /usr/local/share/yarn && \
  tar -xf yarn-${YARN_VERSION}.tar.gz -C /usr/local/share/yarn --strip 1 && \
  ln -sf /usr/local/share/yarn/bin/yarn /usr/local/bin/ && \
  ln -sf /usr/local/share/yarn/bin/yarnpkg /usr/local/bin/
RUN apk del curl gnupg
RUN rm -rf *.tar.gz* /tmp/* \
    /usr/share/man/* /usr/share/doc /root/.npm /root/.node-gyp /root/.config \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/docs \
    /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts && \
  { rm -rf /root/.gnupg || true; }
