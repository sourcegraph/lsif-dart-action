#!/bin/sh

if [ -z "$OUT" ]; then
    echo '$OUT not supplied.'
    exit 1
fi

pub run crossdart --input "${PROJECT_ROOT}" --output "${OUT}"
