#/bin/bash

service dbus start
service avahi-daemon start
node file-server.js &
node firestore.js &
node api-server.js
