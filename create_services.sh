docker service create --name agent1 --hostname agent1 --mount type=bind,target=/etc/puppetlabs,source=`pwd`/env1/agent1/etc/puppetlabs   --mount type=bind,target=/data,source=`pwd`/data --detach=true  --network puppet2 --replicas 1 puppet -c 'sleep inf'
docker service create --name maitre --hostname maitre --mount type=bind,target=/etc/puppetlabs,source=`pwd`/env1/maitre/etc/puppetlabs   --mount type=bind,target=/data,source=`pwd`/data --detach=true  --network puppet2 --replicas 1 puppet -c 'sleep inf'