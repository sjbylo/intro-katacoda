exec >> ~/.start.log 2>>&1

ssh root@host01 "docker pull centos/python-35-centos7:latest" & 
ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0" & 
ssh root@host01 "oc import-image openshift/base-centos7 --confirm -n openshift" & 
ssh root@host01 "docker pull openshift/base-centos7" & 
ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done' &
ssh root@host01 'while ! test -f assets.tgz; do sleep 1; done; cd /root && tar xzf assets.tgz && rm -f assets.tgz' &


wait

