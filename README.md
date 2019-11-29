# MSE example with HLS

This example plays multiple TS segments, similarly to HLS, by using the MSE API.

Note: works only in browser that support MPEG2TS. Tested with WebKit in Safari.

## Getting started

```bash
./download_media.sh
python3 -m http.server
```

Then open a browser with http://0.0.0.0:8000

## Walkthrough

What this example does is to increase the video quality through the playback. Every 1/6 of the video, the quality is increased, from 180p to 1080p.

There are two source buffers: one for vídeo, which changes quality through time; and one for audio which has a fixed quality.
