# nginx 이미지의 메타데이터 확인
docker image inspect nginx

# defaultCmd 컨테이너 실행 및 메타데이터 확인
docker run -d --name defaultCmd nginx
docker container inspect defaultCmd