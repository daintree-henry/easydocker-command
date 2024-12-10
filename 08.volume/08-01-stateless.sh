# 실습 폴더 및 index.html 파일 생성
cd ~/easydocker 
mkdir index 
cd index
echo “Hello Volume” > index.html
cat index.html
ls 

# my-nginx 컨테이너 실행
docker run -d -p 80:80 --name my-nginx nginx

# my-nginx 컨테이너의 index.html 파일을 새롭게 작성한 파일로 교체 
docker cp index.html my-nginx:/usr/share/nginx/html/index.html

# my-nginx 컨테이너삭제
docker rm -f my-nginx

# 새로운 my-nginx 컨테이너 생성
docker run -d -p 80:80 --name my-nginx nginx

# my-nginx 컨테이너의 index.html 파일을 현재 폴더로 복사
docker cp my-nginx:/usr/share/nginx/html/index.html index-from-container.html 

# my-nginx 컨테이너에서 가져온 index.html 파일의 내용 확인
cat index-from-container.html

docker rm -f my-nginx
cd ~/easydocker
rm index.html 
rm index-from-container.html 
rm -r index 
