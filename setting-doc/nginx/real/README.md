### 참고
* 방화벽을 사용한다면 `ufw status verbose` 로 확인 `ufw allow 8888/tcp` 추가
* AWS 방화벽도 추가로 뚫어야함

### nginx 설정
```shell
# /etc/nginx/conf.d/config-service.conf
upstream config-service {
  server 127.0.0.1:9888 max_fails=3 fail_timeout=10s; # blue
  server 127.0.0.1:9889 max_fails=3 fail_timeout=10s; # green
}

server {
  listen 8888;
  server_name 43.200.32.212;
  
  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-For $remote_addr;
    proxy_pass http://config-service;
  }
}
```

### nginx 명령어
```shell
# nginx 시작
service nginx start

# nginx 재시작
service nginx restart

# nignx 설정 리로드
service nginx reload 
```