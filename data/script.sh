#!/bin/bash

ORIGINAL_DIR="/home/admin/wichtig"
ENCRYPTED_DIR="/home/admin/.wichtig_encrypted"
TEMP_MOUNT="/tmp/wichtig_temp"

mkdir -p "$ENCRYPTED_DIR"
gocryptfs -init "$ENCRYPTED_DIR"

mkdir -p "$TEMP_MOUNT"
gocryptfs "$ENCRYPTED_DIR" "$TEMP_MOUNT"
cp -r "$ORIGINAL_DIR"/* "$TEMP_MOUNT"/
fusermount -u "$TEMP_MOUNT"
rmdir "$TEMP_MOUNT"

rm -rf "$ORIGINAL_DIR"
mkdir -p "$ORIGINAL_DIR"
gocryptfs "$ENCRYPTED_DIR" "$ORIGINAL_DIR"
