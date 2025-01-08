# [ 1번 터미널 ] hundredcounter 컨테이너 실행
docker run --name hundredcounter devwikirepo/hundredcounter

# [ 2번 터미널 ] hundredcounter 컨테이너 일시정지
docker pause hundredcounter

# [ 2번 터미널 ] 정지된 상태 확인
docker stats --no-stream hundredcounter

# [ 2번 터미널 ] 컨테이너 종료
docker stop hundredcounter

# [ 2번 터미널 ] 컨테이너 조회(종료된 상태 확인)
docker ps -a

# [ 1번 터미널 ] 컨테이너 실행 및 터미널 연결
docker start -i hundredcounter

# [ 2번 터미널 ] 컨테이너 재시작
docker restart hundredcounter

# [ 1번 터미널 ] 컨테이너 상태 확인 및 로그 조회
docker ps
docker logs hundredcounter

# [ 1번 터미널 ] 컨테이너 로그 지속적으로 출력(Ctrl + C로 종료)
docker logs -f hundredcounter
docker ps

# [ 1번 터미널 ] 컨테이너 삭제
docker rm -f hundredcounter