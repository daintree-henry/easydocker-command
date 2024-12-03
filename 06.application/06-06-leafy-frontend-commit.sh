# [ 1번 터미널 ] node:14 이미지로 컨테이너 실행, 셸 접근
docker run -it --name node node:14 bash

# [ 1번 터미널 ] 컨테이너 내에서 디렉터리 생성 및 이동
mkdir /app && cd /app
ls

# [ 2번 터미널 ] 실습 폴더의 소스 코드를 컨테이너 내부로 복사
cd ~/easydocker/leafy3/leafy-frontend
docker cp . node:/app
	
# [ 1번 터미널 ] 컨테이너 내에서 복사된 소스 코드 확인 및 라이브러리 설치, 애플리케이션 빌드
ls
npm ci
npm build

# [ 1번 터미널 ] 빌드된 결과 파일 확인
ls dist

# [ 2번 터미널 ] node 컨테이너에서 빌드한 결과물을 leafy-frontend 디렉터리로 복사
cd ~/easydocker/leafy3/leafy-frontend
docker cp node:/app/dist .

# [ 2번 터미널 ] node 컨테이너 삭제
docker rm -f node 

# [ 1번 터미널 ] nginx 컨테이너 실행
$ docker run -d -p 80:80 --network leafy-network --name nginx nginx

# [ 1번 터미널 ] node 컨테이너에서 빌드한 결과 파일을 nginx 컨테이너로 복사
docker cp ~/easydocker/leafy3/leafy-frontend/dist/. nginx:/usr/share/nginx/html

# http://localhost로 접속해 로그인 페이지를 확인
# 아이디: john123@qmail.com
# 비밀번호: password123

# [ 2번 터미널 ] nginx 컨테이너 삭제
docker rm -f nginx
