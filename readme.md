docker镜像构建
将Dockerfile和files文件夹放在同一目录下执行构建命令docker build -t sentinel .

启动容器

docker run -d \
    --restart always \
    --name sentinel \
    --network test \
    -e "BIND=0.0.0.0" \
    -e "SENTINEL_PORT=26379" \
    -e "MASTER_IP=172.23.0.2" \
    -e "MASTER_PORT=9221" \
    -e "QUORUM=2" \
    18817810841/sentinel


环境变量解释
BIND 地址限制
SENTINEL_PORT 哨兵端口
MASTER_IP 主服务器ip
MASTER_PORT 主服务器端口
QUORUM 执行仲裁所需哨兵数