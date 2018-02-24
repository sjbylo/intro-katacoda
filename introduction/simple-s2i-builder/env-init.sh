# Send output to a file
exec > ~/.start.log 2>&1

set -x 

#ssh root@host01 'cd /root && while ! test -f assets.tgz; do sleep 1; done; cd /root && tar xzf assets.tgz && rm -f assets.tgz'
ssh root@host01 'cd /root && while ! test -f assets.tar; do sleep 1; done; mkdir test1 && cd test1 && tar xf ../assets.tar && rm -f ../assets.tar'
ssh root@host01 'git clone https://github.com/sjbylo/intro-katacoda.git .tmp && cp -rp .tmp/introduction/simple-s2i-builder/assets/* . && rm -rf .tmp/'

ssh root@host01 "docker pull centos/python-35-centos7:latest" 
ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0"
ssh root@host01 "oc import-image openshift/base-centos7 --confirm -n openshift"
ssh root@host01 "docker pull openshift/base-centos7"
ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'

wait

