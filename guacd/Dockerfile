FROM guacamole/guacd:1.5.0

ENV VERSION 1.5.0

LABEL MAINTAINER="helloworld1024@foxmail.com"

COPY ./fonts/Meslo-LG-L-Regular-Powerline.ttf /usr/share/fonts/
COPY ./fonts/SourceHanSansCN-Regular.otf /usr/share/fonts/

USER root

RUN mkfontscale && mkfontdir && fc-cache