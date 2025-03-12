FROM arm32v6/alpine:3 AS telegraf-armv6

ENV TELEGRAF_VERSION=1.18.1

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz
RUN tar zxvf telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz --strip-components 2 -C /
RUN rm telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz

EXPOSE 8092/udp 8094 8125/udp
CMD telegraf


FROM telegraf-armv6

COPY telegraf.conf /etc/telegraf
CMD telegraf >/proc/1/fd/1 2>&1
