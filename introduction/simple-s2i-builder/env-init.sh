ssh root@host01 'for i in {1..20}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 'for i in {1..20}; do test -f assets.tar && break || sleep 1; done'
ssh root@host01 'tar xf assets.tar && rm -f assets.tar'
ssh root@host01 'docker pull docker.io/openshift/base-centos7'
