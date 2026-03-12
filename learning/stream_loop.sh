#!/bin/bash
while true; do
  ffmpeg -nostdin -re -i "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8" \
    -c:v libx264 -preset veryfast -tune zerolatency -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -f flv rtmp://srv:1935/live/livestream
done