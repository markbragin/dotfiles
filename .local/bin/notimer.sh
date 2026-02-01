#!/bin/bash

pid=$(ps -eo pid,cmd | rg -i "(\d+) /bin/bash.*ttimer " -or '$1')
kill $pid

pid=$(ps -eo pid,cmd | rg -i "(\d+) paplay" -or '$1')
kill $pid
