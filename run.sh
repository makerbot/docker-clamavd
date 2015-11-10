#!/bin/bash
set -m

#
# Vars
#

SUMOCOLLECTORURL="${SUMOCOLLECTORURL:-none}"

#
# Functions
#

logtosumo() {
  message="$1"
  isFile="${2:-false}"
  if [[ "$isFile" == false ]]; then
    curl -s -X POST -T <(echo "${message}") -H "X-Sumo-Name: clamav_$(hostname -s)" "$SUMOCOLLECTORURL"
    echo "${message}"
  else
    curl -s -X POST -T $ -H "X-Sumo-Name: clamav_$(hostname -s)" "$SUMOCOLLECTORURL"
  fi
}

function logToSumoandStdOut() {
    if [[ "$SUMOCOLLECTORURL" != none ]]; then
        tmpfile="$(mktemp)"
        tee > "$tmpfile"
        logtosumo "$tmpfile" true
        rm "$tmpfile"
    else
        cat -
    fi
}

function dailyScan() {

    while true; do
        # Sleep untill 5AM UTC
        sleep $((($(date -f - +%s- <<<$'05:00 tomorrow\nnow')0)%86400))

        # Run scan
        clamscan -r -i /mnt/root 2>&1 | logToSumoandStdOut
    done
}

#
# Background jobs
#

echo Starting ClamAV | logToSumoandStdOut

freshclam -d &
dailyScan &

pids=`jobs -p`

exitcode=0

#
# Trap
#

function terminate() {
    trap "" CHLD

    for pid in $pids; do
        if ! kill -0 $pid 2>/dev/null; then
            wait $pid
            exitcode=$?
        fi
    done

    kill $pids 2>/dev/null
}

trap terminate CHLD
wait

exit $exitcode
