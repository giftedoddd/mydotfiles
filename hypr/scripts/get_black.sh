#!/bin/bash

if pgrep -x "wpaperd"; then
  killall wpaperd >/dev/null
else
  wpaperd -d >/dev/null
fi
