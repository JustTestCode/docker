FROM --platform=$TARGETPLATFORM alpine
ARG TARGETOS
ARG TARGETARCH
ENV VERSION v4.3
ENV DOWNLOAD_URL=https://github.com/snail007/proxy_admin_free/releases/download/
RUN apk update && \
    apk upgrade && \
    apk add curl wget
WORKDIR /app
RUN if [ "$TARGETARCH" = "arm64" ]; \
    then wget ${VERSIONURL}${VERSION}/proxy-admin_arm64.tar.gz -O proxy-admin.tar.gz && tar xzvf proxy-admin.tar.gz ; \
    else wget ${VERSIONURL}${VERSION}/proxy-admin_linux-amd64.tar.gz -O proxy-admin.tar.gz && tar xzvf proxy-admin.tar.gz ; \
    fi 
RUN rm proxy-admin.tar.gz

VOLUME [ "/etc/gpa" ]
EXPOSE 32080

ENTRYPOINT [ "/app/proxy-admin" ]