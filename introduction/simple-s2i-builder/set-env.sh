~/.launch.sh

echo Adding scenario data...

set -x

#exec > .setup.log 2>&1

for i in {1..50}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done

#while ! test -f assets.tgz; do sleep 1; done; tar xzf assets.tgz
#git clone https://github.com/sjbylo/intro-katacoda.git .tmp && cp -frp .tmp/introduction/simple-s2i-builder/assets/* . && rm -rf .tmp/

for i in {1..50}; do test -f assets.tar && break || sleep 1; done
tar xf assets.tar

#docker pull centos/python-35-centos7:latest
#docker pull openshiftroadshow/parksmap-katacoda:1.0.0
#oc import-image openshift/base-centos7 --confirm -n openshift

docker pull openshift/base-centos7
