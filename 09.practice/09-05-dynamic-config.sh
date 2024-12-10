# 변경사항 초기화 및 버전 변경
cd ~/easydocker/leafy3/leafy-frontend
git reset --hard HEAD
git clean -fd
git switch 03-proxy --force

# 파일을 직접 수정하지 않을 경우 버전 변경
git switch 04-dynamicconfig --force 

# 파일 수정
# ~/easydocker/leafy3/leafy-frontend/nginx.conf
# ~/easydocker/leafy3/leafy-frontend/Dockerfile

# 파일 생성
# ~/easydocker/leafy3/leafy-frontend/docker-entrypoint.sh

# 이미지 빌드
docker build -t leafy-front:4.0.0-env . 

# 새롭게 빌드한 이미지로 리피 애플리케이션 실행
docker network create leafy-network
docker run -d --name leafy-postgres -v mydata:/var/lib/postgresql/data --network leafy-network devwikirepo/leafy-postgres:1.0.0
docker run -d -e DB_URL=leafy-postgres --name leafy-dev --network leafy-network devwikirepo/leafy-backend:1.0.0
docker run -d -e BACKEND_HOST=leafy-dev -p 80:80 --name leafy-front --network leafy-network leafy-front:4.0.0-env

# 실제 적용된 nginx.conf 파일 내용 확인
docker exec leafy-front cat etc/nginx/conf.d/default.conf

# http://localhost 접근
# 아이디: john123@qmail.com
# 비밀번호: password123

# 컨테이너 및 볼륨, 네트워크 삭제
docker rm -f leafy-postgres leafy-dev leafy-front
docker volume rm mydata
docker network rm leafy-network
