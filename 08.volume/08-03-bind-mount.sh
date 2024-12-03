# 실습 폴더 생성 및 이동
cd ~/easydocker
mkdir index && cd index

# 실습 폴더의 절대 경로 확인
pwd

# nginx-a 컨테이너 실행 및 실습 폴더에 바인드 마운트
docker run -d -p 8000:80 --name nginx-a -v (pwd명령결과):/usr/share/nginx/html nginx

# nginx-b 컨테이너 실행 및 실습 폴더에 바인드 마운트
docker run -d -p 8001:80 --name nginx-b -v (pwd명령결과):/usr/share/nginx/html nginx 

# 컨테이너 목록 조회
docker ps

# 생성된 볼륨이 없는 것 확인
docker volume ls

# 실습 디렉터리 index에 아무 파일도 없는 것을 확인
ls 

# http://localhost:8000, http://localhost:8001 접속 및 403 에러 확인

# 실습 디렉터리에 index.html 파일 생성
echo "Hello Volume" > index.html 
cat index.html

# http://localhost:8000, http://localhost:8001 접속 및 Hello Volume 페이지 확인

# nginx-a 컨테이너 터미널 접근
docker exec -it nginx-a /bin/bash 

# nginx-a 컨테이너 내부에서 index.html 파일의 내용 확인
ls /usr/share/nginx/html
index.html
cat /usr/share/nginx/html/index.html

# nginx-a 컨테이너 내부에서 index.html 파일의 내용 변경
echo "Bye Volume" > /usr/share/nginx/html/index.html
cat /usr/share/nginx/html/index.html 
exit 

# 실습 폴더의 index.html 파일의 내용이 변경된 것을 확인
cat index.html

# http://localhost:8000, http://localhost:8001 접속 및 Bye Volume 페이지 확인