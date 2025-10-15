#!/usr/bin/env bash
used=$(free -m | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
echo "{\"text\": \" ${used}%\"}"

