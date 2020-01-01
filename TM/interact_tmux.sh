#! /bin/bash

function nl_error {
  echo "interact: $*" >&2
  exit 1
}

export Experiment=Bootstrap
launch_error=''
export VERBOSE='n'

[ -f VERSION ] || nl_error Missing VERSION File
VERSION=`cat VERSION`
[ -d "bin/$VERSION" ] || nl_error "Missing bin directory bin/$VERSION"
export PATH=bin/$VERSION:$PATH

export TMBINDIR=bin/$VERSION

tmux set-environment Experiment $Experiment
tmux set-environment TMBINDIR bin/$VERSION
tmux set-environment PATH $PATH

echo Experiment = $Experiment
echo TMBINDIR = $TMBINDIR

function waitfor {
  name=$1
  duration=$2
  if [ -n "$3" ]; then
    decrement=$3
    delay=1
  else
    decrement=0
    delay=5
  fi
  while [ $duration -gt 0 ]; do
    [ -e $name ] && return 0
    sleep 1
    let duration=duration-$decrement
  done
  return 1
}

function Launch {
  name=$1
  shift
  [ -n "$launch_error" ] && return 1
  [ -n "$VERBOSE" ] && msg "[DEBUG] Launch: $*"
  if { $* & }; then
    Launch_pid=$!
    msg "Launch: $Launch_pid $*"
    # if [ "$name" = "DG/cmd" ]; then
      # parent_loop="-q -M $Launch_pid -t 5"
    # fi
    if [ "$name" != "-" ]; then
      [ "$name" = "-TMC-" ] && name="/var/run/linkeng/run/$Experiment/$!"
      [ "${name#/}" = "$name" ] && name="/var/run/linkeng/$Experiment/$name"
      [ -n "$VERBOSE" ] &&
        msg "[DEBUG] Launch: Waiting for $Launch_pid:$name"
      waitfor $name 10 || {
        msg "[ERROR] Launch: namewait failure: $*"
        launch_error=yes
        return 1
      }
    fi
  else
    msg "[ERROR] Launch: $*"
    launch_error=yes
    return 1
  fi
  return 0
}

function Debug {
  name=$1
  shift
  [ -n "$launch_error" ] && return 1
  [ -n "$VERBOSE" ] && msg "[DEBUG] Debug: $*"
  #program=$1
  gnome-terminal -- gdb --args $*
  if [ "$name" != "-" -a "$name" != "-TMC-" ]; then
    [ "${name#/}" = "$name" ] && name="/var/run/linkeng/$Experiment/$name"
    [ -n "$VERBOSE" ] &&
      msg "[DEBUG] Debug: Waiting for $name"
    waitfor $name 1 0
  fi
  return 0
}

function Dispatch_nc {
  [ "x$1" = "x-" ] && shift 1
  [ -n "$VERBOSE" ] && msg "[DEBUG] Dispatch_nc: $*"
  gnome-terminal -- cyg_nc.sh $* &
}

rm -rf /var/run/linkeng/${Experiment}*
rm -f $Experiment.log *.stackdump
# rm -rf LOG
memoname=/var/run/linkeng/$Experiment/memo
# ls -l $memoname
[ -e $memoname ] || {
  echo "Launching memo for $memoname"
  /usr/local/bin/memo -o Bootstrap.log -l8 &
  waitfor $memoname 2 1 || nl_error "Memo launch failed"
  echo "Memo has launched."
}

Launch      tm_bfr bfr -s Both
Launch      -TMC-  lgr -N `mlf_find LOG` -n lgr
Launch      -TMC-  Bootstrapengext -n engext
Launch      tm_gen Bootstrapcol
Launch      cmd    Bootstrapsrvr -s Both
Launch      -      driver -v
Launch      -      tmdf

tmux new-window -a -t tmux-test:main-window -n ancillary-window 'cyg_nc.sh Bootstrapdispnc -a -t 127.0.0.1 -n disp'
tmux split-window -t tmux-test:ancillary-window.0 -h 'less +F Bootstrap.log'
tmux split-window -t tmux-test:ancillary-window.1 -v 'cyg_nc.sh Bootstrapcltnc -C 127.0.0.1'

exec parent -qV

