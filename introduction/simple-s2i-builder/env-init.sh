ssh root@host01 "touch here0"
ssh root@host01 "touch /root/here1"

pwd 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
id 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
ls -la 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"

LOG=/tmp/run.log

id >> $LOG 2>&1
blah >> $LOG 2>&1
find . >> $LOG 2>&1

ssh root@host01 "touch /root/here2"

cat $LOG | ssh root@host01 "cat > run.log"

#exec >$LOG 2>&1
ssh root@host01 "touch /root/here3"

#function finish {
#	scp $LOG root@host01:
#}
#trap finish EXIT

scp $LOG root@host01:

