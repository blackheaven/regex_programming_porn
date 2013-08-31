#!/usr/local/bin/bash

run()
{
    TIMEFORMAT='%U';
    time ruby benchmark.rb "$1" 2>&1 > /dev/null
}
avg()
{
    echo "$1\n$2\n$3" | awk '{s+=$1} END {print s/NR}'
}

case $1 in
    "memory")
        sed -e "s/PATTERN/$4/g" memory_tpl.rb | sed -e "s/MODIFIER/$5/g" > memory.rb
        raw=$(/usr/bin/time -h -p -l ruby memory.rb 2>&1)
        filtered=$(echo "$raw" | grep max)
        echo ${filtered//[^0-9]/}
        rm memory.rb
        ;;
    "benchmark")
        sed -e "s/PATTERN/$4/g" benchmark_tpl.rb | sed -e "s/MODIFIER/$5/g" > benchmark.rb
        nb=$(ruby benchmark.rb "../$2")
        if [ $nb != "$3" ]
        then
            echo "Error: expect '$3' got '$nb' in ruby with args '$2' '$3' '$4' '$5'"
        else
            avg $(run "../$2" 2>&1) $(run "../$2" 2>&1) $(run "../$2" 2>&1)
        fi
        rm benchmark.rb
        ;;

    esac
