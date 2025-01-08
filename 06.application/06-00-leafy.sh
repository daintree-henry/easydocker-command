# 네트워크 생성
docker network create leafy-network 

# postgres 컨테이너 실행
docker run -d --name leafy-postgres --network leafy-network devwikirepo/leafy-postgres:1.0.0

# 로그 확인(Ctrl + C로 종료)
docker logs -f leafy-postgres

# backend 컨테이너 실행
docker run -d -p 8080:8080 -e DB_URL=leafy-postgres --network leafy-network --name leafy-backend devwikirepo/leafy-backend:1.0.0

# 로그 확인(Ctrl + C로 종료)
docker logs -f leafy-backend

# frontend 컨테이너 실행
docker run -d -p 80:80 --network leafy-network --name leafy-frontend devwikirepo/leafy-frontend:1.0.0

# http://localhost 페이지 접속
# 아이디: john123@qmail.com
# 비밀번호: password123

# 컨테이너 삭제
docker rm -f leafy-frontend leafy-backend leafy-postgres

# 네트워크 삭제
docker network rm leafy-network