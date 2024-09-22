# 실습 폴더 이동, 이미지 빌드
cd ~/easydocker/build/03.envcolorapp 
docker build -f Dockerfile-entrypoint -t buildapp:entrypoint . 


# 컨테이너 실행 (Cmd를 list로 수정)
docker run --name buildapp-entrypoint-list buildapp:entrypoint list

# 컨테이너 실행 (Cmd를 bin/bash로 수정)
docker run -it --name buildapp-entrypoint-bash buildapp:entrypoint bin/bash

# 실습 컨테이너 삭제
docker rm -f buildapp-meta buildapp-arg buildapp-env buildapp-entrypoint-list buildapp-entrypoint-bash