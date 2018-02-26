ssh root@host01 "touch here0"
ssh root@host01 "touch /root/here1"

pwd | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
id | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
ls -la | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"

LOG=/tmp/run.log

id > $LOG

ssh root@host01 "touch /root/here2"
#exec >$LOG 2>&1
ssh root@host01 "touch /root/here3"

function finish {
	scp $LOG root@host01:
}
trap finish EXIT

find . >> $LOG 2>&1

