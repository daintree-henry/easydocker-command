# customCmd 컨테이너 메타데이터의 Cmd 덮어쓰며 실행
docker run --name customCmd nginx cat /usr/share/nginx/html/index.html

# customCmd 컨테이너의 메타데이터 확인
docker container inspect customCmd

# 실행 중인 컨테이너 조회 
docker ps 

# 모든 컨테이너 조회 
docker ps -a