#!/bin/bash

DEPLOY_LOG_PATH="/home/ubuntu/github_action/deploy.log"
SERVICE_NAME="camping-config-service"
IMAGE_VERSION="1.0"

echo "===== $SERVICE_NAME 배포 시작 : $(date +%c) =====" >> $DEPLOY_LOG_PATH

EXIST_BLUE=$(docker ps -f "name=$SERVICE_NAME-blue" | grep Up)

# Blue 기동 중인지 체크( -z : 길이 0인지 )
if [ -z "$EXIST_BLUE" ]; then
  echo "===== Blue Run Start =====" >> $DEPLOY_LOG_PATH
  docker run -d -p 9888:9888 -e "spring.profiles.active=dev" --name $SERVICE_NAME-blue ghcr.io/camping-side/$SERVICE_NAME:$IMAGE_VERSION
  STOP_TARGET_COLOR="green"
  START_TARGET_COLOR="blue"
else
  echo "===== Green Run Start =====" >> $DEPLOY_LOG_PATH
  docker run -d -p 9889:9888 -e "spring.profiles.active=dev" --name $SERVICE_NAME-green ghcr.io/camping-side/$SERVICE_NAME:$IMAGE_VERSION
  STOP_TARGET_COLOR="blue"
  START_TARGET_COLOR="green"
fi

sleep 10

# 신규버전 컨테이너 기동 확인
START_SUCCESS=$(docker ps -f "name=$SERVICE_NAME-$START_TARGET_COLOR" | grep Up)
# -n : 길이가 0이 아닌경우
if [ -n "$START_SUCCESS" ]; then
  docker stop $SERVICE_NAME-$STOP_TARGET_COLOR
  echo "===== 이전 컨테이너 종료 ====="  >> $DEPLOY_LOG_PATH
fi

echo "===== $SERVICE_NAME 배포 종료 : $(date +%c) =====" >> $DEPLOY_LOG_PATH

