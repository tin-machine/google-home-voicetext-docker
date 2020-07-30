#/bin/bash

patch -u node_modules/mdns/lib/browser.js < mdns_patch/browser.js.patch

service dbus start
sleep 3
service avahi-daemon start
sleep 3
node file-server.js &
node firestore.js &
sleep 30
node api-server.js
