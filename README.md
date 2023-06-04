# camping-config-serivce

[Config Server 개념 정리글 바로가기](https://song8420.tistory.com/422)
---
* 중요! 같은 naming rule이라면 config server 설정 우선 적용

---

### 도커 실행
* 도커 로그인
```shell
docker login ghcr.io -u <계정명>
# + 비밀번호 입력
```

* 도커 이미지 가져와서 실행
```shell
# 맨 뒤에 버전은 master 브런치 maven version으로 싱크를 맞춰준다. 
# 혹시나 로컬 rabbitmq를 사용하고 싶다면 profiles를 local로 세팅해주면 된다.
docker run -d -p 9888:9888 -e "spring.profiles.active=dev" --name camping-config-service ghcr.io/camping-side/camping-config-serivce:1.0
```


---

### encrypt key
1. 원하는 key값을 local에 encrypt.key 세팅
2. 서버 구동 후 키값을 파라미터로 encrypt api 호출
3. 결과값으로 camping-profile에 '{cipher}결과값' 세팅

---


---
### Setting Documentation
> [RabbitMQ](./setting-doc/rabbitmq) <br>
> [Github Action](./.github/workflows/deploy.yaml) <br>
> 
> 
> 

---