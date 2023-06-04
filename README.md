# camping-config-serivce

[Config Server 정리글](https://song8420.tistory.com/422)
---
* 중요! 같은 naming rule이라면 config server 설정 우선 적용

---

### 도커 실행
```shell
docker run -d -p 9888:9888 -e "spring.rabbitmq.host=rabbitmq" -e "spring.profiles.active=default" --name config-service dkaskgkdua/config-service:1.0
```


---

### encrypt key
1. 원하는 key값을 local에 encrypt.key 세팅
2. 서버 구동 후 키값을 파라미터로 encrypt api 호출
3. 결과값으로 camping-profile에 '{cipher}결과값' 세팅

---