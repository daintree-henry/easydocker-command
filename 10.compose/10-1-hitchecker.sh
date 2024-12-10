# (build 소스가 없을 경우)
cd ~/easydocker
git clone https://github.com/daintree-henry/build.git
ls
build
cd build

# 실습 폴더 이동 및 변경 사항 초기화
cd ~/easydocker/build
git reset --hard HEAD
git clean -fd
git switch 02-practice --force
cd 07.hitchecker   

# 이미지 빌드
docker compose build

# 생성된 hitchecker 이미지 확인 
docker image ls hitchecker

# 컴포즈 실행
docker compose up -d

# 실행된 컨테이너 확인
docker compose ps

# 실행된 컨테이너의 로그 확인
docker compose logs

# 컨테이너의 상태 확인, 07hitchecker-hitchecker-1 컨테이너 삭제
docker ps
docker rm -f 07hitchecker-hitchecker-1

# 컨테이너의 상태 확인, 07hitchecker-hitchecker-1 컨테이너 삭제
docker compose up -d
docker compose down