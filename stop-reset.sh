#!/bin/bash
_interupt() {
    echo "Shutdown ${CHILD_PIDS}"
    kill -TERM ${CHILD_PIDS}
    exit
}

trap _interupt INT TERM

echo "Killing existing FRE Process"

pkill FRE || echo "No existing FRE processes"
