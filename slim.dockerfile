# FROM mhart/alpine-node:10
# FROM alpine:3.7

# FROM mhart/alpine-node:12
# FROM alpine:3.9

FROM mhart/alpine-node:14
FROM alpine:3.11

COPY --from=0 /usr/bin/node /usr/bin/

RUN apk upgrade --no-cache -U && \
  apk add --no-cache binutils libstdc++ && \
  strip /usr/bin/node && \
  apk del binutils
