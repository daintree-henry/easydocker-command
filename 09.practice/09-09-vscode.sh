# 실습폴더 이동 및 버전 변경
cd ~/easydocker/leafy3
git reset --hard HEAD
git clean -fd
git switch 06-devcontainer --force 

# VSCode에서 새로 실행한 터미널에서 Node.js의 버전을 확인
node --version 
npm --version
npm run serve 