# 이미지 다운로드
docker pull devwikirepo/envnodecolorapp

# 다운로드한 이미지 확인
docker image ls

# 이미지의 메타데이터 확인(Env 및 Cmd)
docker image inspect devwikirepo/envnodecolorapp

# 기본 메타데이터로 컨테이너 실행
docker run -d -p 8080:3000 --name defaultColorApp devwikirepo/envnodecolorapp 

# COLOR 변수를 blue로 수정한 컨테이너 실행
docker run -d -p 8081:3000 --name blueColorApp --env COLOR=blue devwikirepo/envnodecolorapp

# env를 수정한 컨테이너의 메타데이터 확인
docker container inspect blueColorApp

# 컨테이너 조회 및 모든 컨테이너 삭제
docker ps -a
docker rm -f defaultCmd customCmd defaultColorApp blueColorApp