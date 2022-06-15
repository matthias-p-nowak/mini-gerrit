rem short
echo "starting"
docker-compose down 
rem remove gerrit volume if desired
timeout 60
docker-compose build --progress plain || exit /b
docker image ls gerrit
docker-compose up -d || exit /b
echo "all done"