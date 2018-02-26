i=0
let i=i+1; ssh root@host01 "touch here$i"

pwd 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"

id 2>&1 | ssh root@host01 "cat >> commands"
ssh root@host01 "echo >> commands"

ls -la 2>&1 | ssh root@host01 "cat >> commands"
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

cat $LOG | ssh root@host01 "cat > run.log"

let i=i+1; ssh root@host01 "touch here$i"

#exec >$LOG 2>&1
let i=i+1; ssh root@host01 "touch here$i"

function finish {
	cat $LOG | ssh root@host01 "cat > $LOG"
}
trap finish EXIT

#scp $LOG root@host01:

let i=i+1; ssh root@host01 "touch here$i"

ssh root@host01 "chown -R root.root builder/ src/"

let i=i+1; ssh root@host01 "touch hereend$i"

