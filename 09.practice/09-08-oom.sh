# [ 1번 터미널 ] 이벤트 출력
docker events

# [ 2번 터미널 ] 컨테이너 실행
docker run -d --name memoryuse devwikirepo/memoryuse

# [ 2번 터미널 ] 메모리와 CPU 사용량 관찰 (Ctrl + C로 종료)
docker stats

# [ 2번 터미널 ] 메모리 제한이 10MB인 컨테이너 실행
docker run -d --name memoryuse-withlimit --memory=10M devwikirepo/memoryuse


# [ 2번 터미널 ] 메모리와 CPU 사용량 관찰 (Ctrl + C로 종료)
docker stats

# [ 2번 터미널 ] 컨테이너의 상태 확인
docker ps -a

# [ 2번 터미널 ] 실습 컨테이너 삭제
docker rm -f memoryuse memoryuse-withlimit