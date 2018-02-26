#!/bin/sh 

ssh root@host01 "touch here0"
ssh root@host01 "touch /root/here1"

pwd | ssh root@host01 "cat >> commands 2>&1"
ssh root@host01 "echo >> commands 2>&1"
id | ssh root@host01 "cat >> commands 2>&1"
ssh root@host01 "echo >> commands 2>&1"
ls -la | ssh root@host01 "cat >> commands 2>&1"
ssh root@host01 "echo >> commands 2>&1"

LOG=/tmp/run.log

id > $LOG

ssh root@host01 "touch /root/here2"
#exec >$LOG 2>&1
ssh root@host01 "touch /root/here3"

#function finish {
#	scp $LOG root@host01:
#}
#trap finish EXIT

find . >> $LOG 2>&1
scp $LOG root@host01:

#----------------------------------
# SJB cat > /tmp/setup.sh <<END
# SJB #!/bin/bash -x
# SJB #exec > .setup.log 2>&1
# SJB 
# SJB for i in {1..50}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done
# SJB 
# SJB #while ! test -f assets.tgz; do sleep 1; done; tar xzf assets.tgz
# SJB #git clone https://github.com/sjbylo/intro-katacoda.git .tmp && cp -frp .tmp/introduction/simple-s2i-builder/assets/* . && rm -rf .tmp/
# SJB 
# SJB for i in {1..50}; do test -f assets.tar && break || sleep 1; done
# SJB tar xf assets.tar
# SJB 
# SJB #docker pull centos/python-35-centos7:latest
# SJB #docker pull openshiftroadshow/parksmap-katacoda:1.0.0
# SJB #oc import-image openshift/base-centos7 --confirm -n openshift
# SJB 
# SJB docker pull openshift/base-centos7
# SJB END
#----------------------------------

scp /tmp/setup.sh root@host01:

