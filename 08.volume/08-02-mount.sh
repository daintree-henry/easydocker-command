# 실습볼륨 생성 및 확인
docker volume create mydata
docker volume ls
docker volume inspect mydata

# my-postgres 컨테이너 실행 및 mydata 볼륨 마운트
docker run -d --name my-postgres -e POSTGRES_PASSWORD=password -v mydata:/var/lib/postgresql/data postgres:13 

# my-postgres 컨테이너 메타데이터 확인 (Mounts 필드 확인)
docker container inspect my-postgres

# my-postgres 컨테이너 터미널 접근 및 데이터베이스 생성
docker exec -it my-postgres psql -U postgres -c "CREATE DATABASE mydb;"
docker exec -it my-postgres psql -U postgres -c "\list"

# my-postgres 컨테이너 삭제
docker rm -f my-postgres

# mydata 볼륨은 그대로 남아있는 것을 확인
docker volume ls

# my-postgres-2 컨테이너 실행 및 mydata 볼륨 마운트
docker run -d --name my-postgres-2 -v mydata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password postgres:13 

# my-postgres 컨테이너 터미널 접근 및 데이터베이스 조회
docker exec -it my-postgres-2 psql -U postgres -c "\list"

# 실습 컨테이너 및 볼륨 삭제
docker rm -f my-postgres-2
docker volume rm mydata