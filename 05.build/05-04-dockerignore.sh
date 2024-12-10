# 실습 폴더 이동, 이미지 빌드
cd ~/easydocker/build/02.buildcontext
docker build -t buildcontext:ignorejunk .

rm .dockerignore
docker build -t buildcontext:ignorejunk .
