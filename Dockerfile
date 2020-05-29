FROM alpine:latest as builder

MAINTAINER "Team Blue Nebula"

# print all commands during build
SHELL ["sh", "-x", "-c"]

ARG HUGO_VERSION=0.71.1

# the hugo from apk doesn't do image processing
# we need this for the background, though
# therefore we just use the hugo release binaries from GitHub
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar xz hugo -C /bin

COPY . /ws
WORKDIR /ws

RUN hugo --gc && find


FROM caddy:alpine

COPY --from=builder /ws/public /usr/share/caddy
