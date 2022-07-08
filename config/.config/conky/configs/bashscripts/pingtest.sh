#!/bin/bash
if ping -c 1 -W 2 www.duckduckgo.com > /dev/null; then
  echo 'ONLINE'
else
  echo 'OFFLINE'
fi

