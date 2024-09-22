# 실습 폴더 이동 및 변경 사항 초기화
cd ~/easydocker/leafy3 
git reset --hard HEAD && git clean -fd
git switch 07-compose-init 

# 컴포즈 실행
docker compose up -d

# http://localhost 페이지 접속
# 아이디: john123@qmail.com
# 비밀번호: password123

# 컴포즈 종료
docker compose down -v