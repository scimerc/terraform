# ~/.bash_logout

history -a $HISTFILE

cat -n ${HISTFILE} | sort -u -k 2 | sort -k 1,1n | awk '{$1 = ""; gsub ( "^ ", "", $0 ); print $0;}' > ${HISTFILE}.tmp
mv ${HISTFILE}.tmp ${HISTFILE}
