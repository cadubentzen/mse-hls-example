#!/bin/bash

# Download m3u8s
mkdir -p m3u8s
cd m3u8s
wget -nc https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa_audio_1_stereo_128000.m3u8
for quality in 180_250000 270_400000 360_800000 540_1200000 720_2400000 1080_4800000
do
    wget -nc https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa_video_$quality.m3u8
done
cd ..

# Download video segments
mkdir -p videos
cd videos
for quality in 180_250000 270_400000 360_800000 540_1200000 720_2400000 1080_4800000
do
    mkdir -p $quality
    cd $quality
    for segment in {0..52}
    do
        wget -nc https://bitdash-a.akamaihd.net/content/MI201109210084_1/video/$quality/hls/segment_$segment.ts
    done
    cd ..
done
cd ..

# Download audio segments
mkdir -p audio
cd audio
for segment in {0..52}
do
    wget -nc https://bitdash-a.akamaihd.net/content/MI201109210084_1/audio/1_stereo_128000/hls/segment_$segment.ts
done
cd ..
