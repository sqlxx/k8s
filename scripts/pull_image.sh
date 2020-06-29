#!/bin/bash

version=v1.18.3
mirror=registry.aliyuncs.com/google_containers
echo "Pull image for k8s version $version"
images=(kube-apiserver:$version kube-controller-manager:$version kube-scheduler:$version kube-proxy:$version pause:3.2 etcd:3.4.3-0 coredns:1.6.7)

for imageName in ${images[@]} ; do
  docker pull $mirror/$imageName
  docker tag $mirror/$imageName k8s.gcr.io/$imageName
  docker rmi $mirror/$imageName
done

