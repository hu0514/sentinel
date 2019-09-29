From centos

RUN yum install wget vim -y \
    && cd /mnt \
    && wget https://github.com/pourer/pikamgr/releases/download/v1.0.0-alpha/pikamgr-linux-x86_64-v1.0.0-alpha.tar.gz \
    && tar zxvf pikamgr-linux-x86_64-v1.0.0-alpha.tar.gz \
    && cp bin/redis-cli /usr/bin/ \
    && cp bin/redis-sentinel /usr/bin/ \
    && chmod +x /usr/bin/redis-cli \
    && chmod +x /usr/bin/redis-sentinel \
    && yum clean all \
    && rm -rf /mnt/* 

COPY ./files/sentinel.conf /home/root/sentinel.conf
COPY ./files/start.sh /tmp/start.sh

RUN chmod +x /tmp/start.sh

ENTRYPOINT ["/tmp/start.sh"]
