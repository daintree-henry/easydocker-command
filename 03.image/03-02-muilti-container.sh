# multinginx1 컨테이너 실행
docker run -d --name multinginx1 nginx

# multinginx2 컨테이너 실행
docker run -d --name multinginx2 nginx

# multinginx3 컨테이너 실행
docker run -d --name multinginx3 nginx

# 컨테이너 리스트 조회
docker ps

# 컨테이너 삭제(실패)
docker rm multinginx1

# 3개의 실행 중인 컨테이너 강제 삭제
docker rm -f multinginx1 multinginx2 multinginx3