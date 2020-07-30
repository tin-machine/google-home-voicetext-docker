#/bin/bash

patch -u node_modules/mdns/lib/browser.js < mdns_patch/browser.js.patch

service dbus start
service avahi-daemon start
node file-server.js &
node firestore.js &
node api-server.js
