FROM cursor/mbase
MAINTAINER Ryan Pederson <ryan@pederson.ca>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ wily multiverse" >> /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get -y install software-properties-common

RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes  sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \
    par2 python-yenc unzip unrar && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD start.sh /
RUN chmod +x /start.sh

VOLUME ["/volumes/config","/volumes/media","/volumes/media"]

EXPOSE 8080

CMD /start.sh
