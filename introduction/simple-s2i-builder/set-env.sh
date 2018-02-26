# These lines get piped and echoed into the actual console!
~/.launch.sh

stty -echo
export PS1=""
#clear

echo Adding scenario data...

for i in {1..20}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done

for i in {1..20}; do test -f assets.tar && break || sleep 1; done
tar xf assets.tar && rm -f assets.tar

docker pull docker.io/openshift/base-centos7

#while ! test -f assets.tgz; do sleep 1; done; tar xzf assets.tgz
#git clone https://github.com/sjbylo/intro-katacoda.git .tmp && cp -frp .tmp/introduction/simple-s2i-builder/assets/* . && rm -rf .tmp/

#clear
export PS1="$ "
echo "Ready"
stty echo
