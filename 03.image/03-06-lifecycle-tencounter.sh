# 컨테이너 생성
docker create --name tencounter devwikirepo/tencounter

# 생성된 컨테이너 확인
docker ps -a

# 리소스 조회
docker stats --no-stream tencounter

# 컨테이너 시작
docker start tencounter

# 시작된 컨테이너 확인(실행 10초 후 종료된 상태 확인)
docker ps -a 

# 컨테이너 시작 및 출력 연결(컨테이너가 종료된 후 실행)
docker start -i tencounter

# 실습 컨테이너 삭제
docker rm -f tencounter