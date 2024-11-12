#!/bin/bash

if [ $# != 1 ]; then
  echo "Usage: $0 bazel-bin-path"
  echo "Eg: $0 bazel-bin/offboard/vis/vantage/vantage > trace-0.log"
  exit
fi

pname=$1
pid=$(ps aux | pgrep "$pname" | pgrep -v grep | pgrep -v "$0" | awk '{print $2}')

echo "Get all thread trace for pid: $pid of $pname"
gdb "$pname" -p "$pid" -ex "thread apply all bt" -ex "detach" -ex "quit"
