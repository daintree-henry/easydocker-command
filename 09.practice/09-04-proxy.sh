# 변경사항 초기화 및 버전 변경
cd ~/easydocker/leafy3/leafy-frontend
git reset --hard HEAD
git clean -fd
git switch 02-cache --force

# 파일을 직접 수정하지 않을 경우 버전 변경
git switch 03-proxy --force

# 파일 수정
# ~/easydocker/leafy3/leafy-frontend/src/api/api.js
# ~/easydocker/leafy3/leafy-frontend/nginx.conf
# ~/easydocker/leafy3/leafy-frontend/Dockerfile

# 파일 수정 후 이미지 빌드
docker build -t leafy-frontend:3.0.0-proxy . 

# 새롭게 빌드한 이미지로 리피 애플리케이션 실행
docker network create leafy-network
docker run -d --name leafy-postgres -v mydata:/var/lib/postgresql/data --network leafy-network devwikirepo/leafy-postgres:1.0.0
# 약 20초 뒤 실행
docker run -d -e DB_URL=leafy-postgres --name leafy --network leafy-network devwikirepo/leafy-backend:1.0.0
docker run -d -p 80:80 --name leafy-frontend --network leafy-network leafy-frontend:3.0.0-proxy

# 컨테이너 리스트 확인
docker ps

# http://localhost/api/v1/users 접속 및 페이지 확인
# http://localhost 접속  페이지 확인

# 컨테이너 및 볼륨, 네트워크 삭제
docker rm -f leafy-postgres leafy leafy-frontend
docker volume rm mydata
docker network rm leafy-network
