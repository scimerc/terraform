# user specific aliases and functions

export AWKPATH="${AWKPATH}:$HOME/lib/awk:$HOME/.local/lib/awk"
export AWK_INCLUDE="\
    -f abs.awk \
    -f nucleocode.awk \
    -f genotype.awk \
    -f gflip.awk \
    -f gmatch.awk \
"

alias joint="join --check-order -t $'\t'"
alias sortt="sort -t $'\t'"
alias tawk="awk -F $'\t'"
alias vi="/usr/bin/vim -p"
alias gvi="/usr/bin/gvim -p"
alias la="LC_COLLATE=C ls -lA --time-style='+%Y-%m-%d %H:%M:%S'"
alias lq="ls -lA --group-directories-first --time-style='+%Y-%m-%d %H:%M:%S'"
alias mydate="date '+%Y-%m-%d'"
alias mycompdate="date '+%Y%m%d'"
alias perlex="perl -p -e"
alias t='transpose.perl'

function gfind() {
  find . -type f -exec grep -n "$@" '{}' \+ 2>&1 | grep "$@"
}
export -f gfind

function mysqueue() {
  squeue --format='%A %j %c %C %d %D %f %m %R %S %t %v %X %Y %z' --sort='-t,i' $* | column -t
}
export -f mysqueue

function mysrun() {
  srun --ntasks=1 --mem-per-cpu=4G --qos=devel --account=nn9114k --pty $*
}
export -f mysrun

function myscp() {
  false
  while [ $? -ne 0 ]; do
    scp $*
  done
}
export -f myscp

function myssh() {
  false
  while [ $? -ne 0 ]; do
    ssh $*
  done
}
export -f myssh

function bdy() {
  local argcnt=1
  local optcnt=1
  unset myargs
  unset myopts
  local mycmd=$1; shift
  for carg in "$@" ; do
    if [[ -f "${carg}" ]] ; then
      myargs[${argcnt}]=${carg}
      argcnt=$((argcnt + 1))
    else
      myopts[${optcnt}]=${carg}
      optcnt=$((optcnt + 1))
    fi
  done

  local cnt=1;
  if (( ${#myargs[@]} > 0 )) ; then
    if (( cnt == 1 )) ; then
      head -n 1 "${myargs[${cnt}]}"
      tail -n +2 "${myargs[${cnt}]}" | eval ${mycmd} ${myopts[@]}
    else
      eval ${mycmd} ${myopts[@]} "${myargs[${cnt}]}"
    fi
    cnt=$((cnt + 1))
  else
    read myheader
    printf '%s\n' "${myheader}"
    eval ${mycmd} ${myopts[@]} /dev/stdin
  fi
}
export -f bdy

rename() {
  local -r fromtext=$1
  local -r totext=$2
  shift 2
  for f in "$@" ; do
    [ -e "$f" ] && mv $f ${f/${fromtext}/${totext}}
  done
}
export -f rename

tab() {
  sed -r 's/[ \t]+/\t/g;' "${*:-/dev/stdin}"
}
export -f tab

trim() {
  sed -r 's/^[ \t]+//g; s/[ \t]+$//g;' "${*:-/dev/stdin}"
}
export -f trim

