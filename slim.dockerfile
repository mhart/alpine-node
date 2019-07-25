FROM mhart/alpine-node:6
# FROM mhart/alpine-node:8
FROM alpine:3.6

# FROM mhart/alpine-node:10
# FROM alpine:3.7

# FROM mhart/alpine-node:12
# FROM alpine:3.9

COPY --from=0 /usr/bin/node /usr/bin/
RUN apk add --no-cache binutils libstdc++ && \
  strip /usr/bin/node && \
  apk del binutils
