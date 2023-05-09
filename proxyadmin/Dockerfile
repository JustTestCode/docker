FROM --platform=$TARGETPLATFORM debian
ARG TARGETOS
ARG TARGETARCH
ENV VERSION v4.3
ENV DOWNLOAD_URL=https://github.com/snail007/proxy_admin_free/releases/download/
RUN apt update && \
    apt upgrade && \
    apt install curl wget -y
WORKDIR /app
RUN if [ "$TARGETARCH" = "arm64" ]; \
    then wget ${DOWNLOAD_URL}${VERSION}/proxy-admin_arm64.tar.gz -O proxy-admin.tar.gz && tar xzvf proxy-admin.tar.gz ; \
    else wget ${DOWNLOAD_URL}${VERSION}/proxy-admin_linux-amd64.tar.gz -O proxy-admin.tar.gz && tar xzvf proxy-admin.tar.gz ; \
    fi
RUN rm proxy-admin.tar.gz

VOLUME [ "/etc/gpa" ]
EXPOSE 32080
ENTRYPOINT [ "/app/proxy-admin" ]