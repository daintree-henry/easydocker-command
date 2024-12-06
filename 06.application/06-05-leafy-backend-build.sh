# 실습 폴더 이동
cd ~/easydocker/leafy3/leafy-backend

# 이미지 빌드 및 푸시
docker build -t (레지스트리계정명)/leafy-backend:1.0.0 . --no-cache
docker push (레지스트리계정명)/leafy-backend:1.0.0

# 빌드한 이미지를 사용해 백엔드 컨테이너 실행
docker run -d -p 8080:8080 -e DB_URL=leafy-postgres --name leafy-backend --network leafy-network (레지스트리계정명)/leafy-backend:1.0.0 

# 실행된 컨테이너의 로그 조회
docker logs leafy-backend