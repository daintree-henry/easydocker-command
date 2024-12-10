# limit 설정이 없는 컨테이너 실행
docker run -d --name no-limit nginx

# 메모리와 CPU 제한 확인
docker inspect no-limit 

# CPU 0.5, 메모리 256M로 제한한 컨테이너 실행
docker run -d --name with-limit --cpus=0.5 --memory=256M nginx

# 메모리와 CPU 제한 확인
docker inspect with-limit

# 컨테이너 삭제
docker rm -f no-limit with-limit