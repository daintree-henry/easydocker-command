# 실습 폴더 이동, 이미지 빌드
cd ~/easydocker/build/04.javahelloapp
docker build -f Dockerfile.multistage -t javaappmulti .

# 빌드한 두 개의 이미지 비교
docker image ls javaappsingle   
docker image ls javaappmulti      