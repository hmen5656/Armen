FROM balenalib/raspberry-pi-python:latest AS build
# use `install_packages` if you need to install dependencies

RUN install_packages build-essential cron
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir --no-use-pep517 RPi.GPIO


# Set our working directory
WORKDIR /app

# Copy requirements.txt first for better cache on later pushes
COPY ./app/requirements*.txt ./

# pip install python deps from requirements.txt on the resin.io build server
RUN pip3 install --use-pep517 --no-cache-dir -r requirements-base.txt -r requirements-rpi.txt




RUN ln -s /usr/local/bin/python3 /usr/bin/python3
RUN ln -s /usr/local/bin/python3 /usr/bin/python

WORKDIR /app
COPY ./app ./

# Keep the container running
CMD ["sleep", "infinity"]