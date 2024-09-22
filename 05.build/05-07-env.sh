# 실습 폴더 이동, 이미지 빌드
cd ~/easydocker/build/03.envcolorapp 
docker build -f Dockerfile-arg -t buildapp:arg . 
docker build -f Dockerfile-env -t buildapp:env .

# 컨테이너 실행
docker run -d --name buildapp-arg -p 3001:3000 buildapp:arg
docker run -d --name buildapp-env -p 3002:3000 buildapp:env

# 컨테이너 확인
docker ps

# http://localhost:3001, http://localhost:3002 접속