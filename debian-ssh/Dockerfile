FROM --platform=$TARGETPLATFORM debian:11
ENV VERSION 11
RUN apt update && apt install openssh-server iproute2 -y
RUN apt autoclean && apt autoremove
RUN mkdir /root/.ssh
RUN mkdir -p /var/run/sshd
RUN echo "$SSH_PUB$" | cat > /root/.ssh/authorized_keys
RUN sed -i "s/#Port 22/Port 22222/" /etc/ssh/sshd_config \
    && chmod 600 /root/.ssh/authorized_keys \
    && sed -i '/Protocol/d' /etc/ssh/sshd_config \
    && echo "Protocol 2" >> /etc/ssh/sshd_config \
    && sed -i "s/.*RSAAuthentication.*/RSAAuthentication yes/g" /etc/ssh/sshd_config \
    && sed -i "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config \
    && sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
    && sed -i "s/.*AuthorizedKeysFile.*/AuthorizedKeysFile\t\.ssh\/authorized_keys/g" /etc/ssh/sshd_config \
    && sed -i "s/.*PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
EXPOSE 22222
COPY run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]
