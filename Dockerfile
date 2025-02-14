FROM robsontenorio/laravel:3.5

LABEL maintainer="Brian Verschoore"
LABEL site="https://github.com/briavers/laravel-docker-cypress"

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm
ENV npm_config_loglevel=warn
ENV npm_config_unsafe_perm=true
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV CHROME_VERSION=132.0.6834.83
ENV FIREFOX_VERSION=125.0.3
ENV CI=1
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress

USER root

RUN apt update && apt install -y \
    # Cypress dependencies \
    libgtk2.0-0t64  \
    libgtk-3-0t64  \
    libgbm-dev  \
    libnotify-dev  \
    libnss3  \
    libxss1  \
    libasound2t64  \
    libxtst6  \
    xauth  \
    xvfb \
    # Extra dependencies
    fonts-liberation \
    libappindicator3-1 \
    xdg-utils \
    mplayer \
    apt-utils \
    bzip2 \
    wget

# Chrome
RUN wget -O /usr/src/google-chrome-stable_current_amd64.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb" && \
    dpkg -i /usr/src/google-chrome-stable_current_amd64.deb ; \
    apt-get install -f -y && \
    rm -f /usr/src/google-chrome-stable_current_amd64.deb

# Firefox
RUN cd /opt && wget -O firefox.tar.bz2 "https://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2"

RUN cd /opt && tar -xvf firefox.tar.bz2
RUN cd /opt && rm firefox.tar.bz2
RUN cd /opt && ln -s /opt/firefox/firefox /usr/bin/firefox
