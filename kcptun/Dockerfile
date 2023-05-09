FROM golang:alpine as builder
ARG TARGETOS
ARG TARGETARCH
ENV VERSION 1.0
ENV GO111MODULE=on
RUN apk update && \
    apk upgrade && \
    apk add git gcc libc-dev linux-headers rust
WORKDIR /src

RUN git clone https://github.com/xtaci/kcptun.git
RUN cd kcptun && CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} && \
    go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/xtaci/kcptun/server && \
    go build -mod=vendor -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" -gcflags "" -o kcptun_server github.com/xtaci/kcptun/server


RUN git clone https://github.com/triole/supervisord
RUN cd supervisord && \
    go generate && \
    go get -u && \
    CGO_ENABLED=0 go build -tags release -a -ldflags "-linkmode external -extldflags -static" -o /usr/local/bin/supervisord github.com/ochinchina/supervisord



FROM alpine

COPY --from=builder /usr/local/bin/supervisord /usr/local/bin/supervisord
COPY --from=builder /src/kcptun/kcptun_server /bin/kcptun_server
WORKDIR /usr/local/bin
ENTRYPOINT ["/usr/local/bin/supervisord"]