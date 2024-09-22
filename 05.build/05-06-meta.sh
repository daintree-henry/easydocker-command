# 실습 폴더 이동, 이미지 빌드
cd ~/easydocker/build/03.envcolorapp 
docker build -f Dockerfile-meta -t buildapp:meta .

# 컨테이너 실행
docker run -d -p 3000:3000 --name buildapp-meta buildapp:meta

# http://localhost:3000, http://localhost:3000/henry 접속
