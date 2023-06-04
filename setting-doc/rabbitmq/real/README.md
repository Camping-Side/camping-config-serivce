### Amazon MQ 사용
[AmazonMQ 세팅방법](https://song8420.tistory.com/429)

* yml 세팅방법
```properties
spring:
  rabbitmq:
    host: b-30d5fceb-8119-4270-ba48-b7cd3d155416.mq.ap-northeast-2.amazonaws.com
    port: 5671
    username: <username>
    password: <password>
#    virtual-host: /camping
    ssl:
      enabled: true
    listener:
      simple:
        acknowledge-mode: manual
```


[참고1](https://jkpark.me/springboot/aws/rabbitmq/java/2021/01/10/Spring-Boot%EC%97%90%EC%84%9C-AmazonMQ%EC%9D%98-RabbitMQ-%EC%97%B0%EB%8F%99-1.html)