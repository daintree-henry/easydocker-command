# 소스 코드 다운로드
cd ~/easydocker
mkdir my-leafy
cd my-leafy
git clone (포크한 깃허브 레파지토리 주소) . 
ls -a

# 변경사항 커밋 및 푸시
cd ~/easydocker/my-leafy
git add .
git commit -m "안내문구 어제로 변경"
git remote set-url origin https://(복사한토큰)@(레파지토리주소)
# 예시: 
# git remote set-url origin https://ghp_aBcDe@github.com/username/repo.git
git push origin 08-cicd

# 변경사항 커밋 및 푸시
cd ~/easydocker/my-leafy
git add .
git commit -m "안내문구 내일로 변경"
git push  

# 변경사항 커밋 및 푸시
cd ~/easydocker/my-leafy
git add .
git commit -m "로그인 아이디 변경"
git push  

# 변경사항 커밋 및 푸시
cd ~/easydocker/my-leafy
git add .
git commit -m "파이프라인 디렉터리 수정"
git push 

# 변경사항 커밋 및 푸시
cd ~/easydocker/my-leafy
git add .
git commit -m "로그인 아이디 변경"
git push  

# 파이프라인에서 푸시한 이미지로 컴포즈 실행
cd ~/easydocker/my-leafy
docker compose up -d

# 컴포즈 종료
docker compose down -v