# [ 1번 터미널 ] postgres:13 이미지로 컨테이너 실행 및 터미널 접근
docker run -d --name postgres -e POSTGRES_PASSWORD=password postgres:13
docker exec -it postgres /bin/bash

# [ 1번 터미널 ] 컨테이너 내 파일 구조 확인
ls

# [ 1번 터미널 ] 컨테이너 내 데이터베이스 설정파일 확인
cat /var/lib/postgresql/data/postgresql.conf

# [ 1번 터미널 ] 컨테이너 내 docker-entrypoint-initdb.d 디렉터리 확인
ls -al /docker-entrypoint-initdb.d 

# [ 2번 터미널 ] 실습 폴더의 init.sql 파일을 컨테이너 내부로 복사
cd ~/easydocker/leafy3/leafy-postgresql
docker cp ./init/init.sql postgres:/docker-entrypoint-initdb.d/

# [ 2번 터미널 ] 실습 폴더의 postgresql.conf 파일을 컨테이너 내부로 복사
docker cp ./config/postgresql.conf postgres:/etc/postgresql/cusom.conf

# [ 1번 터미널 ] 컨테이너 내에서 테이블 리스트 확인(테이블 없음)
psql -U postgres -c "\d"

# [ 1번 터미널 ] 컨테이너 내에서 init.sql 실행
psql -U postgres -f /docker-entrypoint-initdb.d/init.sql

# [ 1번 터미널 ] 컨테이너 내에서 테이블 리스트 확인(테이블 생성됨)
psql -U postgres -c "\d"

# [ 2번 터미널 ] 컨테이너 삭제
docker rm -f postgres