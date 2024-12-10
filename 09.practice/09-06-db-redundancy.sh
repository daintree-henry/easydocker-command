# 변경사항 초기화 및 버전 변경
cd ~/easydocker/leafy3/leafy-postgresql
git reset --hard HEAD
git clean -fd
git switch 05-redundancy --force

# postgres 네트워크 생성
docker network create postgres

# postgres-primary-0 컨테이너 실행
docker run -d \
  --name postgres-primary-0 \
  --network postgres \
  -v postgres_primary_data:/bitnami/postgresql \
  -e POSTGRESQL_POSTGRES_PASSWORD=adminpassword \
  -e POSTGRESQL_USERNAME=myuser \
  -e POSTGRESQL_PASSWORD=mypassword \
  -e POSTGRESQL_DATABASE=mydb \
  -e REPMGR_PASSWORD=repmgrpassword \
  -e REPMGR_PRIMARY_HOST=postgres-primary-0 \
  -e REPMGR_PRIMARY_PORT=5432 \
  -e REPMGR_PARTNER_NODES=postgres-primary-0,postgres-standby-1:5432 \
  -e REPMGR_NODE_NAME=postgres-primary-0 \
  -e REPMGR_NODE_NETWORK_NAME=postgres-primary-0 \
  -e REPMGR_PORT_NUMBER=5432 \
  bitnami/postgresql-repmgr:15

# postgres-standby-1 컨테이너 실행
docker run -d \
  --name postgres-standby-1 \
  --network postgres \
  -v postgres_standby_data:/bitnami/postgresql \
  -e POSTGRESQL_POSTGRES_PASSWORD=adminpassword \
  -e POSTGRESQL_USERNAME=myuser \
  -e POSTGRESQL_PASSWORD=mypassword \
  -e POSTGRESQL_DATABASE=mydb \
  -e REPMGR_PASSWORD=repmgrpassword \
  -e REPMGR_PRIMARY_HOST=postgres-primary-0 \
  -e REPMGR_PRIMARY_PORT=5432 \
  -e REPMGR_PARTNER_NODES=postgres-primary-0,postgres-standby-1:5432 \
  -e REPMGR_NODE_NAME=postgres-standby-1 \
  -e REPMGR_NODE_NETWORK_NAME=postgres-standby-1 \
  -e REPMGR_PORT_NUMBER=5432 \
  bitnami/postgresql-repmgr:15

# 실행된 컨테이너 확인
docker ps

# 컨테이너의 로그 확인
docker logs -f postgres-primary-0
docker logs -f postgres-standby-1

# 프라이머리 컨테이너에 테이블 생성
docker exec -it -e PGPASSWORD=mypassword postgres-primary-0 psql -U myuser -d mydb -c "CREATE TABLE sample (id SERIAL PRIMARY KEY, name VARCHAR(255));"

# 프라이머리 컨테이너에 데이터 삽입
docker exec -it -e PGPASSWORD=mypassword postgres-primary-0 psql -U myuser -d mydb -c "INSERT INTO sample (name) VALUES ('John'), ('Jane'), ('Alice');"

# 스탠바이 컨테이너에 데이터 조회
docker exec -it -e PGPASSWORD=mypassword postgres-standby-1 psql -U myuser -d mydb -c "SELECT * FROM sample;"

# 실습 컨테이너, 볼륨, 네트워크 삭제
docker rm -f postgres-primary-0 postgres-standby-1
docker volume rm postgres_primary_data postgres_standby_data
docker network rm postgres 