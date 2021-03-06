FROM ubuntu:trusty
RUN apt-get update -y
RUN apt-get install -y libxss1 libappindicator1 libindicator7 wget -y xdg-utils libnss3 fonts-liberation gconf-service libasound2 libgconf-2-4 curl
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > chrome.deb && dpkg -i chrome.deb && apt-get install -f && rm -f chrome.deb

# Install Node Stable (v7)
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash
RUN apt-get install -y nodejs

ADD grab.sh /usr/lib/node_modules/npm/node_modules/grab.sh
ADD index.js /usr/lib/node_modules/npm/node_modules/index.js

WORKDIR /usr/lib/node_modules/npm/node_modules
RUN npm install chrome-remote-interface minimist 

CMD /usr/lib/node_modules/npm/node_modules/grab.sh
