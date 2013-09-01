#!/usr/local/bin/bash

run()
{
    TIMEFORMAT='%U';
    time java Benchmark < "$1" 2>&1 > /dev/null
}
avg()
{
    echo "$1\n$2\n$3" | awk '{s+=$1} END {print s/NR}'
}
protect()
{
    echo "$1" | sed -e 's/\\/\\\\/g'
}

case $1 in
    "memory")
        sed -e "s/PATTERN/$(protect $4)/g" Memory_tpl.java | sed -e "s/MODIFIER/$(protect $5)/g" > Memory.java
        javac Memory.java
        raw=$(/usr/bin/time -h -p -l java -Xmx256M -Xms256M Memory 2>&1)
        filtered=$(echo "$raw" | grep max)
        echo ${filtered//[^0-9]/}
        rm Memory.*
        ;;
    "benchmark")
        sed -e "s/PATTERN/$(protect $4)/g" Benchmark_tpl.java | sed -e "s/MODIFIER/$(protect $5)/g" > Benchmark.java
        javac Benchmark.java
        nb=$(java Benchmark < "../$2")
        if [ $(($nb - $3)) -ne 0 ]
        then
            echo "Error: expect '$3' got '$nb' in java with args '$2' '$3' '$4' '$5'"
        else
            avg $(run "../$2" 2>&1) $(run "../$2" 2>&1) $(run "../$2" 2>&1)
        fi
        rm Benchmark.*
        ;;

    esac
