# user specific aliases and functions
alias vi="/usr/bin/vim -p"
alias gvi="/usr/bin/gvim -p"
alias lq="ls -A -l --color=tty --time-style='+%Y-%m-%d %H:%M:%S'"
alias mydate="date '+%Y-%m-%d'"
alias myjspec="jspec -A -d 12 -b 32"
alias myqstat32="ssh lws10 qstat -n -u ${USER}"
alias myqstat="qstat -n -u ${USER}"
alias perlex="perl -p -e"
alias tsdftp="sftp p33-franbe@tsd-fx01.tsd.usit.no"
alias windows="xfreerdp /f /v:win.uio.no"
alias wintsd="ssh -L 9999:p33-win01:3389 p33-franbe@jh.tsd.usit.no"

