FROM node:11

RUN npm update -y -g npm
RUN apt-get update
RUN apt-get install -y vim avahi-daemon libavahi-compat-libdnssd-dev locales
RUN locale-gen ja_JP.UTF-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

RUN git clone https://github.com/sikkimtemi/google-home-voicetext.git
WORKDIR google-home-voicetext
RUN npm install
RUN patch -uR node_modules/mdns/lib/browser.js < mdns_patch/browser.js.patch
COPY boot.bash /usr/local/bin/

CMD ["/usr/local/bin/boot.bash"]