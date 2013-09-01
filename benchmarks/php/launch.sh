#!/usr/local/bin/bash

run()
{
    TIMEFORMAT='%U';
    time php benchmark.php < "$1" 2>&1 > /dev/null
}
avg()
{
    echo "$1\n$2\n$3" | awk '{s+=$1} END {print s/NR}'
}

case $1 in
    "memory")
        sed -e "s/PATTERN/$4/g" memory_tpl.php | sed -e "s/MODIFIER/$5/g" > memory.php
        raw=$(/usr/bin/time -h -p -l php memory.php 2>&1)
        filtered=$(echo "$raw" | grep max)
        echo ${filtered//[^0-9]/}
        rm memory.php
        ;;
    "benchmark")
        sed -e "s/PATTERN/$4/g" benchmark_tpl.php | sed -e "s/MODIFIER/$5/g" > benchmark.php
        nb=$(php benchmark.php < "../$2")
        if [ $(($nb - $3)) -ne 0 ]
        then
            echo "Error: expect '$3' got '$nb' in php with args '$2' '$3' '$4' '$5'"
        else
            avg $(run "../$2" 2>&1) $(run "../$2" 2>&1) $(run "../$2" 2>&1)
        fi
        rm benchmark.php
        ;;

    esac
