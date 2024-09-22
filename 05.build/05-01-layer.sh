# 실습 이미지 다운로드
docker image pull devwikirepo/hello-nginx
docker image pull devwikirepo/config-nginx
docker image pull devwikirepo/pre-config-nginx

# 다운로드한 이미지의 히스토리 확인
docker image history devwikirepo/hello-nginx
docker image history devwikirepo/config-nginx
docker image history devwikirepo/pre-config-nginx

# 다운로드한 이미지의 레이어 확인
docker image inspect devwikirepo/hello-nginx --format '{{.RootFS.Type}} {{range .RootFS.Layers}}{{println .}}{{end}}'
docker image inspect devwikirepo/config-nginx --format '{{.RootFS.Type}} {{range .RootFS.Layers}}{{println .}}{{end}}'
docker image inspect devwikirepo/pre-config-nginx --format '{{.RootFS.Type}} {{range .RootFS.Layers}}{{println .}}{{end}}'