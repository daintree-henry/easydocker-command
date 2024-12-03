# 실습 네트워크 생성
docker network create leafy-network

docker run -d -p 5432:5432 --name postgres --network leafy-network devwikirepo/leafy-postgres:1.0.0

# 실습 컨테이너와 네트워크 삭제
docker rm -f postgres
postgres
docker network rm leafy-network
leafy-network
