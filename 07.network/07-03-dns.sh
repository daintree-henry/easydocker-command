# [ 1번 터미널 ] 실습 폴더 이동
cd ~/easydocker

# [ 2번 터미널 ] 실습 폴더 이동
cd ~/easydocker

# [ 1번 터미널 ] 네트워크 생성 및 확인
docker network create --driver bridge --subnet 10.0.0.0/24 second-bridge
docker network ls 

# [ 1번 터미널 ] containerA 실행 및 터미널 접근
docker run -it --network second-bridge --name containerA devwikirepo/pingbuntu bin/bash

# [ 1번 터미널 ] 컨테이너 내에서 DNS 설정 정보 확인
cat /etc/resolv.conf

# [ 1번 터미널 ] 컨테이너 내에서 containerB로 ping 확인(실패)
ping containerB

# [ 2번 터미널 ] containerB 컨테이너 실행 및 IP 주소 확인
docker run -d --network second-bridge --name containerB devwikirepo/pingbuntu
docker inspect containerB | grep "IPAddress" 

# [ 1번 터미널 ] 컨테이너 내에서 containerB로 ping 확인(정상, Ctrl + C로 종료)
ping containerB

# [ 2번 터미널 ] containerB 삭제
docker rm -f containerB

# [ 1번 터미널 ] 컨테이너 내에서 containerB로 ping 확인(실패)
ping containerB

# [ 2번 터미널 ] 실습 컨테이너 및 네트워크 삭제
docker rm -f containerA
docker network rm second-bridge 