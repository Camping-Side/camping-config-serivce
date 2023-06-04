### local rabbitmq 기동
```shell
docker run d --network=com-network -p 15671:15671 -p 15672:15672 -p 4369:4369 -p 5671:5671 -p 5672:5672 --env=RABBITMQ_DATA_DIR=/var/lib/rabbitmq --env=RABBITMQ_PGP_KEY_ID=0x0A9AF2115F4687BD29803A206B73A36E6026DFCA --env=HOME=/var/lib/rabbitmq --env=LANG=C.UTF-8 --env=PATH=/opt/rabbitmq/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=RABBITMQ_HOME=/opt/rabbitmq --env=LANGUAGE=C.UTF-8 --env=LC_ALL=C.UTF-8 --env=RABBITMQ_VERSION=3.11.10 --volume=/var/lib/rabbitmq --restart=no --label=''org.opencontainers.image.ref.name=ubuntu'' --label=''org.opencontainers.image.version=20.04'' --label='org.opencontainers.image.ref.name=ubuntu' --label='org.opencontainers.image.version=20.04' --runtime=runc -d rabbitmq:3.11-management
```
