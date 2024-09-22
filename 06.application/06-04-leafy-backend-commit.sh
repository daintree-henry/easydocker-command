# [ 1번 터미널 ] gradle, jdk가 구성된 이미지로 컨테이너 실행, 셸 접근
docker run -it --name gradle gradle:7.6.1-jdk17 bash

# [ 1번 터미널 ] 컨테이너 내에서 디렉터리 생성 및 이동
mkdir /app && cd /app
ls

# [ 2번 터미널 ] 실습 폴더의 소스 코드를 컨테이너 내부로 복사
cd ~/easydocker/leafy3/leafy-backend
docker cp . gradle:/app

# [ 1번 터미널 ] 컨테이너 내에서 복사된 소스 코드 확인 및 애플리케이션 빌드
ls
gradle clean build

# [ 1번 터미널 ] 빌드된 애플리케이션 아티팩트 확인
ls build/libs

# [ 1번 터미널 ] 빌드된 애플리케이션 실행(실행 에러)
java -jar build/libs/Leafy.jar

# [ 1번 터미널 ] 컨테이너 내부에서 환경변수 지정
export DB_URL=leafy-postgres 

# [ 1번 터미널 ] 빌드된 애플리케이션 재실행
java -jar build/libs/Leafy.jar