#!/bin/sh -x
NOM=registry.loc
HJ=env1
MAITRE=maitre
echo generating keys for $NOM
docker run -it -h ${MAITRE} --name ${MAITRE} --rm -v /root/workspace/data:/data -v `pwd`/${HJ}/${MAITRE}/etc/puppetlabs:/etc/puppetlabs puppet -c "puppet cert generate ${NOM}"

echo fetching /etc/puppetlabs from  $NOM in /root/workspace/data
docker run -it -h ${NOM} --name ${NOM} --rm -v /root/workspace/data:/data puppet -c "tar cvf /data/${NOM}.tar /etc/puppetlabs"
mkdir -p ${HJ}/${NOM}
cd ${HJ}/${NOM}

echo restoring initial data in ${PWD}
tar xvf /root/workspace/data/${NOM}.tar
cd ../..

echo restoring keys
(cd ${HJ}/${MAITRE};find -name "${NOM}.pem" -o -name "ca.pem" |cpio -o )|(cd ${HJ}/${NOM}; cpio -idmv)
