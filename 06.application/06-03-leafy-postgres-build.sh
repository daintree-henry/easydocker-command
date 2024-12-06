# 네트워크 생성
docker network create leafy-network

# 실습 폴더 이동
cd ~/easydocker/leafy3/leafy-postgresql

# 이미지 빌드 및 푸시
docker build -t (레지스트리계정명)/leafy-postgres:1.0.0 . --no-cache
docker push (레지스트리계정명)/leafy-postgres:1.0.0

# 빌드한 이미지를 사용해 데이터베이스 컨테이너 실행
docker run -d --name leafy-postgres --network leafy-network (레지스트리계정명)/leafy-postgres:1.0.0 

# 실행된 컨테이너의 로그 조회
docker logs leafy-postgres

# 컨테이너의 데이터베이스 셸로 접근
docker exec -it leafy-postgres su postgres bash -c "psql --username=myuser --dbname=mydb"

# 컨테이너 내에서 실행 중인 데이터베이스의 데이터 조회
SELECT * FROM users;
SELECT * FROM plants;
SELECT * FROM user_plants;
SELECT * FROM plant_logs;
\q
exit

# 이미지 히스토리 조회
docker image history (레지스트리계정명)/leafy-postgres:1.0.0