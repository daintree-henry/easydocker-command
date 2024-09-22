# 실습 폴더 이동
cd ~/easydocker/build/09.multidb-env

# 컴포즈 실행
docker compose up -d 

# 컨테이너의 로그 확인
docker compose logs

# 실행된 컨테이너 및 볼륨 확인
docker ps 
docker volume ls

# 컴포즈 다운
docker compose down 

# 볼륨이 남아있는것 확인
docker volume ls

# 볼륨도 함께 제거
docker compose down -v