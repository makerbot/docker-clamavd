FROM ubuntu:trusty

MAINTAINER Makerbot Devops <devops@makerbot.com>

ENV CLAMAV_VERSION 0.98.7

RUN bash -c "echo -e deb{,-src}\ http://archive.ubuntu.com/ubuntu/\ $(lsb_release -cs){,-security,-updates}\ multiverse\\\\n >> /etc/apt/sources.list.d/multiverse.list" && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        clamav-daemon=${CLAMAV_VERSION}* \
        clamav-freshclam=${CLAMAV_VERSION}* \
        libclamunrar6 \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /var/lib/clamav/main.cvd http://database.clamav.net/main.cvd && \
    wget -O /var/lib/clamav/daily.cvd http://database.clamav.net/daily.cvd && \
    wget -O /var/lib/clamav/bytecode.cvd http://database.clamav.net/bytecode.cvd && \
    chown clamav:clamav /var/lib/clamav/*.cvd

RUN mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 750 /var/run/clamav

RUN sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/clamd.conf && \
    echo "TCPSocket 3310" >> /etc/clamav/clamd.conf && \
    sed -i 's/^Foreground .*$/Foreground true/g' /etc/clamav/freshclam.conf

VOLUME ["/var/lib/clamav"]

EXPOSE 3310

ADD run.sh /

CMD ["/run.sh"]
