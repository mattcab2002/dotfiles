#!/usr/bin/env bash
ifconfig | grep en0 -A 5 | grep inet[\ ] | awk '{print $2}'
