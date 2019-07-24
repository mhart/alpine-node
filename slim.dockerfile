# FROM mhart/alpine-node:6
# FROM mhart/alpine-node:8
# FROM mhart/alpine-node:10
FROM mhart/alpine-node:12
RUN apk add --no-cache binutils && \
  strip /usr/bin/node && \
  apk del binutils

# FROM alpine:3.6
# FROM alpine:3.7
FROM alpine:3.9
COPY --from=0 /usr/bin/node /usr/bin/
COPY --from=0 /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
