FROM alpine:3.9
ENV VERSION=v12.22.3 NPM_VERSION=6 YARN_VERSION=v1.22.10

# FROM alpine:3.11
# ENV VERSION=v14.17.3 NPM_VERSION=6 YARN_VERSION=v1.22.10

# FROM alpine:3.13
# ENV VERSION=v16.4.2 NPM_VERSION=7 YARN_VERSION=v1.22.10

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl gnupg libstdc++

RUN curl -sfSLO https://unofficial-builds.nodejs.org/download/release/${VERSION}/node-${VERSION}-linux-x64-musl.tar.xz && \
  curl -sfSLO https://unofficial-builds.nodejs.org/download/release/${VERSION}/SHASUMS256.txt && \
  grep " node-${VERSION}-linux-x64-musl.tar.xz\$" SHASUMS256.txt | sha256sum -c | grep ': OK$' && \
  tar -xf node-${VERSION}-linux-x64-musl.tar.xz -C /usr --strip 1 && \
  rm node-${VERSION}-linux-x64-musl.tar.xz

RUN npm install -g npm@${NPM_VERSION} && \
  find /usr/lib/node_modules/npm -type d \( -name test -o -name .bin \) | xargs rm -rf

RUN for server in hkps://keys.openpgp.org ipv4.pool.sks-keyservers.net keyserver.pgp.com ha.pool.sks-keyservers.net; do \
    gpg --keyserver $server --recv-keys \
      6A010C5166006599AA17F08146C2130DFD2497F5 && break; \
  done && \
  curl -sfSL -O https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz -O https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz.asc && \
  gpg --batch --verify yarn-${YARN_VERSION}.tar.gz.asc yarn-${YARN_VERSION}.tar.gz && \
  mkdir /usr/local/share/yarn && \
  tar -xf yarn-${YARN_VERSION}.tar.gz -C /usr/local/share/yarn --strip 1 && \
  ln -s /usr/local/share/yarn/bin/yarn /usr/local/bin/ && \
  ln -s /usr/local/share/yarn/bin/yarnpkg /usr/local/bin/ && \
  rm yarn-${YARN_VERSION}.tar.gz*

RUN apk del curl gnupg && \
  rm -rf /SHASUMS256.txt /tmp/* \
    /usr/share/man/* /usr/share/doc /root/.npm /root/.node-gyp /root/.config \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/docs \
    /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts && \
  { rm -rf /root/.gnupg || true; }
