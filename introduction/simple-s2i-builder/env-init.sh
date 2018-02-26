i=0
let i=i+1; ssh root@host01 "touch here$i"

pwd 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
id 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"
ls -la 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"

let i=i+1; ssh root@host01 "touch here$i"

LOG=run.log
let i=i+1; ssh root@host01 "touch here$i"

id >> $LOG 2>&1
let i=i+1; ssh root@host01 "touch here$i"
blah >> $LOG 2>&1
let i=i+1; ssh root@host01 "touch here$i"
find . >> $LOG 2>&1
let i=i+1; ssh root@host01 "touch here$i"

let i=i+1; ssh root@host01 "touch here$i"

cat $LOG | ssh root@host01 "cat > run.log"

#exec >$LOG 2>&1
let i=i+1; ssh root@host01 "touch here$i"

#function finish {
#	scp $LOG root@host01:
#}
#trap finish EXIT

scp $LOG root@host01:

let i=i+1; ssh root@host01 "touch here$i"

