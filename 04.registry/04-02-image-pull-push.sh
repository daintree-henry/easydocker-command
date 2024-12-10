# 이미지 다운로드
docker pull devwikirepo/simple-web:1.0

# 새 이미지 태그 생성
docker tag devwikirepo/simple-web:1.0 (레지스트리계정명)/my-simple-web:0.1

# 생성된 이미지 태그 확인
docker image ls

# 새롭게 태그한 이미지 푸시
docker push (레지스트리계정명)/my-simple-web:0.1

# 도커허브 로그인
docker login 

# 이미지 푸시
docker push (레지스트리계정명)/my-simple-web:0.1

# 로컬 이미지 삭제
docker image rm (레지스트리계정명)/my-simple-web:0.1
docker image rm devwikirepo/simple-web:1.0

# 도커허브의 이미지를 다운받아 컨테이너 실행
docker run -d -p 80:80 --name my-simple-web (레지스트리계정명)/my-simple-web:0.1

# 실습 컨테이너 삭제
docker rm -f my-simple-web