FROM balenalib/raspberry-pi-python:3.7-buster-run-20210506 AS build

# use `install_packages` if you need to install dependencies
RUN install_packages build-essential cron

# Set our working directory
WORKDIR /app

# Copy requirements.txt first for better cache on later pushes
COPY ./app/requirements*.txt ./

# pip install python deps from requirements.txt on the resin.io build server
RUN pip3 install --no-cache-dir -r requirements-base.txt -r requirements-rpi.txt

RUN ln -s /usr/local/bin/python3 /usr/bin/python3
RUN ln -s /usr/local/bin/python3 /usr/bin/python

WORKDIR /app
COPY ./app ./

CMD ["bash", "start.sh"]
