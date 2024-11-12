#!/bin/bash
ps aux | grep scripts | grep -v "grep" | awk '{print $2}'

