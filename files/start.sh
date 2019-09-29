#!/bin/bash

CONFIG="/home/root/sentinel.conf"

if [ -z $BIND ];then
    BIND=0.0.0.0
fi
sed -i "s&^bind .*$&bind $BIND&g" $CONFIG

if [ -z $SENTINEL_PORT ];then
   SENTINEL_PORT=26379
fi

if [ -z $MASTER_IP ];then
   MASTER_IP=127.0.0.1
fi

if [ -z $MASTER_PORT ];then
   MASTER_PORT=6379
fi

if [ -z $QUORUM ];then
   QUORUM=2
fi

sed -i "s&^sentinel monitor mymaster .*$&sentinel monitor mymaster $MASTER_IP $MASTER_PORT $QUORUM&g" $CONFIG



if [ ! -d /data/sentinel ];then
    mkdir -p /data/sentinel
fi

if [ ! -f /data/sentinel/sentinel.conf ];then
    cp /home/root/sentinel.conf /data/sentinel/
fi

if [ ! -f /data/sentinel/sentinel.log ];then
    touch /data/sentinel/sentinel.log
fi

exec /usr/bin/redis-sentinel  /data/sentinel/sentinel.conf
