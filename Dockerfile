FROM node:17.1.0-slim as builder

WORKDIR /app

COPY . /app

RUN apt update \
    && yarn install \
    && yarn run nuxt build

FROM node:17.1.0-slim

WORKDIR /nuxt

COPY --from=builder /app/.output /nuxt

EXPOSE 3000

CMD node /nuxt/server/index.mjs
