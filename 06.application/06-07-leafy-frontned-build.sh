# 실습 폴더 이동
cd ~/easydocker/leafy3/leafy-frontend

# 이미지 빌드 및 푸시
docker build -t (레지스트리계정명)/leafy-frontend:1.0.0 . --no-cache
docker push (레지스트리계정명)/leafy-frontend:1.0.0

# 빌드한 이미지를 사용해 프론트엔드 컨테이너 실행
docker run -d -p 80:80 --name leafy-frontend --network leafy-network (레지스트리계정명)/leafy-frontend:1.0.0 

# http://localhost로 접속해 로그인 페이지를 확인
# 아이디: john123@qmail.com
# 비밀번호: password123

# 실행된 컨테이너의 로그 조회
docker logs leafy-frontend

# 실습 컨테이너, 네트워크 삭제
docker rm -f leafy-frontend leafy-backend leafy-postgres 
docker network rm leafy-network 