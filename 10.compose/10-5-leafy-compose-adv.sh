# 실습 폴더 이동 및 변경 사항 초기화
cd ~/easydocker/leafy3 

# 완성된 버전으로 실습을 진행하고 싶을 경우
git switch 07-compose --force


# 컴포즈 실행 및 로그 출력
docker compose up -d 
docker compose logs

# 컴포즈 종료
docker compose down -v