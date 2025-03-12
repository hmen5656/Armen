# GrowOff Module Core

## Installation (Development)

For development, install the Python app in a virtual environment:

    python3 -m venv env
    source env/bin/activate
    pip install -r requirements-base.txt
    pip install -r requirements-dev.txt  # on Mac only
    pip install -r requirements-rpi.txt  # on RPi only

Run it:

    ./run.sh

You can set environment variables by creating a `.env` in this directory. See `env.sample` for guidance.


## Virtual Hardware

To test on a Mac using virtual hardware, set the following in a `.env` file:

    MOCK_HW_ENABLED=1
    DATA_DIR_PATH="./var"


## Automated Testing

Before pushing changes, run the self-test:

    ./run.sh test

Make sure all tests were run and there are no errors.
