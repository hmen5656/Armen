#!/bin/bash

set -euo pipefail  # strict mode

if [ "$#" -gt 1 ]; then
    echo >&2 "usage: ./run.sh [MODE]"
    exit 1
fi


if [ "$#" -eq 1 ] && [ "$1" == "test" ]; then
    export MOCK_HW_ENABLED=1
    export DATA_DIR_PATH="./var"
    mkdir -p $DATA_DIR_PATH

    python -m unittest -v
elif [ "$#" -eq 1 ] && [ "$1" == "mock" ]; then
    export MOCK_HW_ENABLED=1
    export DATA_DIR_PATH="./var"
    export GROWOFF_MODULE_ID="test"

    python ./scripts/run.py
elif [ "$#" -eq 1 ] && [ "$1" == "mockwater" ]; then
    export MOCK_HW_ENABLED=1
    export DATA_DIR_PATH="./var"
    export GROWOFF_MODULE_ID="test"

    python ./growoff/mvp/Watering_Protocol.py 1
else
    python ./scripts/run.py
fi
