docker run -d -it --rm \
  --name registry -h registry \
  -v `pwd`/registry/etc/puppetlabs:/etc/puppetlabs \
  -v `pwd`/registry/vols/registry:/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:80 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/puppetlabs/puppet/ssl/certs/registry.loc.pem \
  -e REGISTRY_HTTP_TLS_KEY=/etc/puppetlabs/puppet/ssl/private_keys/registry.loc.pem \
  -p 5000:80 \
  registry:latest
