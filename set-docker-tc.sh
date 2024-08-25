#!/bin/sh

nsenter --net="/proc/$(docker inspect --format '{{.State.Pid}}' archmirror-rsync-1)/ns/net" tc qdisc add dev eth0 root tbf burst 1mb rate 500mbit latency 50ms >/dev/null 2>/dev/null
nsenter --net="/proc/$(docker inspect --format '{{.State.Pid}}' archmirror-web-1)/ns/net" tc qdisc add dev eth0 root tbf burst 1mb rate 500mbit latency 50ms >/dev/null 2>/dev/null

exit 0
