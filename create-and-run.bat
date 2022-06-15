@rem short
echo "starting"
docker-compose down 
@rem remove gerrit volume if desired
docker volume prune -f
@REM timeout 60
docker-compose build --progress plain || exit /b
docker image ls gerrit
docker-compose up || exit /b
echo "all done"