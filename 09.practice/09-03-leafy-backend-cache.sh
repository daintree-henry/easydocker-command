# leafy-backend 디렉터리 이동 및 첫 빌드
cd ~/easydocker/leafy3/leafy-backend
docker build -t leafy-backend:2.0.0 .

# PlantController.java 수정

# 소스를 수정한 후 캐시를 사용한 빌드
docker build -t leafy-backend:2.0.1 . 
