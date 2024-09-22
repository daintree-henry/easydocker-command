# 변경사항 초기화 및 버전 변경
cd ~/easydocker/leafy3
git reset --hard HEAD && git clean -fd
git switch 01-dockerfile

# leafy-frontend 디렉터리 이동 및 첫 빌드
cd leafy-frontend
docker build -t leafy-front:2.0.0 . --no-cache

# 캐시를 사용한 빌드
docker build -t leafy-front:2.0.1 .

# src/App.vue 파일 수정

# 소스를 수정한 후 빌드
docker build -t leafy-front:2.0.2 . 

# 도커파일을 직접 수정하지 않을 경우 소스 버전 변경 
git switch 02-cache

# 도커파일 수정 후 빌드
docker build -t leafy-front:2.0.3 . --no-cache

# src/App.vue 파일 수정

# 소스를 수정한 후 빌드
docker build -t leafy-front:2.0.4 .