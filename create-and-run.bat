rem short
echo "starting"
docker-compose down
docker-compose build --progress plain
docker image ls
docker-compose up
echo "all done"