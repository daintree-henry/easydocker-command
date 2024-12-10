# (소스가 없을 경우)
cd ~/easydocker
git clone https://github.com/daintree-henry/build.git
ls
build
cd build

# 실습폴더 이동 및 버전 변경
cd ~/easydocker/build
git reset --hard HEAD
git clean -fd
git switch 02-practice --force
cd 05.go-scratch
ls 

# 이미지 빌드
docker build -t helloworld .

# 빌드된 이미지 확인
docker image ls helloworld

# 이미지를 사용해 컨테이너 실행
docker run -d -p 8080:8080 --name go-helloworld helloworld 

# 실습 컨테이너 삭제
docker rm -f go-helloworld