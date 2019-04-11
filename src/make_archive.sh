#!/bin/bash

VERSION=$(grep "^version=[0-9].[0-9].[0-9]" "avr/platform.txt" | awk -F = '{ print $2 }')

echo
echo "Version: $VERSION"
echo "Creating archive 'anet_board_v$VERSION.tar.gz'"
tar -czf ../archives/anet_board_v$VERSION.tar.gz --transform s/avr/anet_board_v$VERSION/ avr/*
sleep 1s
echo
echo "Package: anet_board_v$VERSION.tar.gz"
echo "SHA256:  `(sha256sum ../archives/anet_board_v$VERSION.tar.gz | awk -v N=1 '{print $N}')`"
echo "Size:    `(ls -al ../archives/anet_board_v$VERSION.tar.gz | awk -v N=5 '{print $N}')`"
echo
