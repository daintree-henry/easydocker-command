# [ 1번 터미널 ] 컨테이너 실행 및 배쉬 셸 접근
docker run -d --name officialNginx nginx 
docker exec -it officialNginx bin/bash 

# [ 2번 터미널 ] 컨테이너 상태 확인
docker ps 

# [ 1번 터미널 ] 컨테이너 내에서 index.html 파일 확인
cat /usr/share/nginx/html/index.html

# [ 1번 터미널 ] index.html 파일의 내용 수정 및 확인
echo hello-my-nginx > /usr/share/nginx/html/index.html
cat /usr/share/nginx/html/index.html

# [ 2번 터미널 ] 컨테이너 커밋
docker commit -m "edited index.html by devwiki" -c 'CMD ["nginx", "-g", "daemon off;"]' officialNginx (레지스트리계정명)/commitnginx

# [ 2번 터미널 ] 커밋으로 생성한 이미지 확인
docker image ls (레지스트리계정명)/commitnginx

# [ 2번 터미널 ] 추가된 이미지 히스토리 확인
docker image history (레지스트리계정명)/commitnginx

# [ 2번 터미널 ] 추가된 이미지로 컨테이너 실행
docker run -d -p 80:80 --name my-nginx (레지스트리계정명)/commitnginx

# [ 2번 터미널 ] 실습 컨테이너 삭제
docker rm -f officialNginx my-nginx

# [ 2번 터미널 ] 실습 이미지 푸시
docker push (레지스트리계정명)/commitnginx