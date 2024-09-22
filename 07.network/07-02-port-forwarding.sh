# 포트포워딩 없이 nginx 컨테이너 실행
docker run -d --name nginx nginx

# 컨테이너의 IP 확인
docker inspect nginx | grep "IPAddress"

# 8001:80 으로 nginx 컨테이너 실행
docker run -d -p 8001:80 --name nginx2 nginx

# http://localhost:8001 접속 및 페이지 확인

# 8002:3000 으로 redColorApp 컨테이너 실행
docker run -d -p 8002:3000 --name redColorApp --env COLOR=red devwikirepo/envnodecolorapp

# http://127.0.0.1:8002 접속 및 페이지 확인

# 8003:3000 으로 blueColorApp 컨테이너 실행
docker run -d -p 8003:3000 --name blueColorApp --env COLOR=blue devwikirepo/envnodecolorapp

# 실습 PC의 IP 주소 확인
(맥OS) ifconfig en0
(윈도우) ipconfig

# 동일한 공유기에 연결된 다른 기기에서 IP주소로 접근 확인
# http://(위에서 확인한 IP):8003

# 8003:3000 으로 yellowColorApp 컨테이너 실행 (포트 충돌)
docker run -d -p 8003:3000 --name yellowColorApp --env COLOR=yellow devwikirepo/envnodecolorapp

# 8004:3030 으로 greenColorApp 컨테이너 실행 (애플리케이션 미사용 포트)
docker run -d -p 8004:3030 --name greenColorApp --env COLOR=green devwikirepo/envnodecolorapp

# http://localhost:8004 페이지 표시되지 않는 것 확인

# 실습 컨테이너 모두 삭제
docker rm -f nginx nginx2 redColorApp blueColorApp yellowColorApp greenColorApp