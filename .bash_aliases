# user specific aliases and functions

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

function mysqueue() {
  squeue --format='%A %j %c %C %d %D %f %m %R %S %t %v %X %Y %z' --sort='-t,i' $* | column -t
}
export -f mysqueue

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

tab() {
  sed -r 's/[ \t]+/\t/g;' "${*:-/dev/stdin}"
}
export -f tab

trim() {
  sed -r 's/^[ \t]+//g; s/[ \t]+$//g;' "${*:-/dev/stdin}"
}
export -f trim

