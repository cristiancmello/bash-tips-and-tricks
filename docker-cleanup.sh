# ~/.bash_aliases

docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -qf dangling=true)
docker volume ls -qf dangling=true | xargs -r docker volume rm
docker rmi -f $(docker images -q -f dangling=true)
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)
docker rmi -f $(docker images | grep "none" | awk '/ / { print $3 }')
docker rmi -f $(docker images -q)
docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
