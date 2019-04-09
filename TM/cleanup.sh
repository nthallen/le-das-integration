#! /bin/bash
pids=''
function survey {
ps -s |
while read pid tty stime command ; do
  case $command in
    */bin/memo) echo $pid;;
    */bin/lgr)  echo $pid;;
    */bin/bfr)  echo $pid;;
    */bin/1.0/Bootstrap*) echo $pid;;
  esac
done
}

pids=`survey`
[ -n "$pids" ] && kill $pids
