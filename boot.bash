#/bin/bash

# patch -u node_modules/mdns/lib/browser.js < mdns_patch/browser.js.patch

service dbus start
avahi-daemon --daemonize --no-drop-root
sleep 1
node file-server.js &
node firestore.js &
node api-server.js
