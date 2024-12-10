# [ 1번 터미널 ] 네트워크 리스트 조회
docker network ls 

# [ 1번 터미널 ] bridge 리스트 상세 조회 및 second-bridge 네트워크 생성
docker network inspect bridge
docker network create --driver bridge --subnet 10.0.0.0/24 --gateway 10.0.0.1 second-bridge

# [ 1번 터미널 ] 생성된 네트워크 확인
docker network ls
docker network inspect second-bridge

# [ 2번 터미널 ] ubuntuA 컨테이너 실행
docker run -d --name ubuntuA devwikirepo/pingbuntu

# [ 2번 터미널 ] ubuntuB 컨테이너 실행 및 터미널 접근
docker run -it --name ubuntuB devwikirepo/pingbuntu /bin/bash

# [ 3번 터미널 ] ubuntuC 컨테이너 실행 및 터미널 접근
docker run -it --network second-bridge --name ubuntuC devwikirepo/pingbuntu /bin/bash

# [ 1번 터미널 ] 실행된 3개의 컨테이너 리스트 확인
docker ps

# [ 1번 터미널 ] 각 컨테이너들의 IP 확인(IPAddress 필드)
docker container inspect ubuntuA
docker container inspect ubuntuB
docker container inspect ubuntuC

# [ 2번 터미널 ] ubuntuB -> ubuntuA 로 신호 
ping 172.17.0.2
(ubuntuA 컨테이너의IP, 다를 경우 위에서 확인한 IP로 수정)

# [ 2번 터미널 ] ubuntuB -> ubuntuC 로 신호 
ping 10.0.0.2
(ubuntuC 컨테이너의IP, 다를 경우 위에서 확인한 IP로 수정)

# [ 3번 터미널 ] ubuntuC -> ubuntuA 로 신호 
ping 172.17.0.2 
(ubuntuA 컨테이너의IP, 다를 경우 위에서 확인한 IP로 수정)

# [ 1번 터미널 ] 실습에 사용한 컨테이너 및 네트워크 제거
docker rm -f ubuntuA ubuntuB ubuntuC
docker network rm second-bridge