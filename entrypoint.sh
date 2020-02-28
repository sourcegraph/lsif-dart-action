#!/bin/sh

if [ -z "$OUT" ]; then
    echo 'file not supplied.'
    exit 1
fi

pub run crossdart --input "${PROJECT_ROOT}"
mv dump.lsif "$OUT"
