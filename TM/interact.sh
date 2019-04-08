#! /bin/bash
function nl_error {
  echo "interact: $*" >&2
  exit 1
}

export Experiment=Bootstrap
launch_error=''
VERBOSE=''

function waitfor {
  name=$1
  duration=$2
  while [ $duration -gt 0 ]; do
    [ -e $name ] && return 0
    sleep 1
    # let duration=duration-1
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

rm -rf /var/run/linkeng/${Experiment}*
rm -f $Experiment.log
rm -rf LOG
memoname=/var/run/linkeng/$Experiment/memo
# ls -l $memoname
[ -e $memoname ] || {
  echo "Launching memo for $memoname"
  cygstart mintty memo -o Bootstrap.log -l0 -V -v
  waitfor $memoname 2 || nl_error "Memo launch failed"
}

# Launch tm_bfr cygstart mintty gdb bfr
Launch tm_bfr bfr -v
# Launch - cygstart mintty gdb lgr
Launch - lgr
# Launch tm_gen cygstart mintty gdb ./Bootstrapcol
Launch tm_gen ./Bootstrapcol
Launch cmd ./Bootstrapsrvr -v
cygstart mintty ./doBootstrapclt.sh
