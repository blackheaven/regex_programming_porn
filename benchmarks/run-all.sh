#!/usr/local/bin/bash
ls | grep -v textes | grep -v '\.' | grep -v README | while read lg; do ./bench.sh "$lg" "$1" "$2" "$3" "$4"; done
