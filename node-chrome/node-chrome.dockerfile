FROM node:12.16.1

ENV CHROME_BIN /usr/bin/google-chrome

# Install chrome
RUN wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get -y update && \
    apt-get -y --no-install-recommends install ./tmp/google-chrome-stable_current_amd64.deb && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "/bin/bash" ]