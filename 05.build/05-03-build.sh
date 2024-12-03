# 소스코드 복사
cd ~/easydocker
git clone https://github.com/daintree-henry/build.git
ls
cd build

# 도커파일을 직접 작성하고 싶을 경우
git switch 00-init --force 

# 완성된 버전으로 실습을 진행하고 싶을 경우
git switch 01-dockerfile --force 

cd ~/easydocker/build/01.buildnginx

# 이미지 빌드
docker build -t (레지스트리계정명)/buildnginx .

# 빌드한 이미지로 컨테이너 실행
docker run -d -p 80:80 --name build-nginx (레지스트리계정명)/buildnginx

# 실습 컨테이너 삭제
docker rm -f build-nginx

# 실습 컨테이너 푸시
docker push (레지스트리계정명)/buildnginx