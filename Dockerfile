FROM node:17.1.0-slim as builder

WORKDIR /app

COPY . /app

RUN apt-get update \
    && yarn install \
    && yarn run nuxt build

FROM node:17.1.0-slim

ENV NUXT_HOST=0.0.0.0

WORKDIR /nuxt

COPY --from=builder /app/.output /nuxt/.output

CMD node .output/server/index.mjs
