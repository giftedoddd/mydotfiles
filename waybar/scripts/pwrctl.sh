#!/bin/bash

STATUS=$(tlp-stat --mode)

if [[ $STATUS == *"AC"* ]]; then
    echo "A"
else
    echo "B"
fi
