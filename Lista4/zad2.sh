#!/usr/bin/env bash

function write {
        echo "PID~PPID~NAME~numofopenfiles"
        for f in /proc/[0-9]*; do
                Name=$(cat $f/status | grep -i "Name:" | awk '{print $2}')
                Pid=($(grep "Pid.*" $f/status))
                Ppid=$(cat $f/status | grep -i "Ppid:" | awk '{print $2}')
                noof=($(sudo ls -l $f/fd))
                echo "${Pid[1]}~${Ppid}~${Name}~${#noof[0]}"
        done
}
write | column -t -s '~'

