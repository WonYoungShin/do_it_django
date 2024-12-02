#!/bin/bash

# REPOSITORY 경로 설정
REPOSITORY=/home/ubuntu

# 이동할 프로젝트 경로
PROJECT_DIR=$REPOSITORY/do_it_django

# 로그 파일 설정
LOG_FILE=$PROJECT_DIR/deploy.log

# 현재 날짜 및 시간
NOW=$(date +"%Y-%m-%d %H:%M:%S")

# 프로젝트 디렉토리로 이동
echo "[$NOW] Navigating to project directory: $PROJECT_DIR" | tee -a $LOG_FILE
cd $PROJECT_DIR

# 기존 Docker 서비스 종료
echo "[$NOW] Stopping existing Docker services." | tee -a $LOG_FILE
sudo docker-compose down >> $LOG_FILE 2>&1

# 새로운 Docker 서비스 시작
echo "[$NOW] Starting new Docker services." | tee -a $LOG_FILE
sudo docker-compose up -d --build >> $LOG_FILE 2>&1

# Docker 서비스 상태 확인
echo "[$NOW] Checking Docker services status." | tee -a $LOG_FILE
sudo docker ps | tee -a $LOG_FILE

echo "[$NOW] Deployment complete." | tee -a $LOG_FILE
