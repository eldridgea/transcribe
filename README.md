# Transcribe #

This is what I use to add srt subtitle files to directories full of video files. It uses ffmpeg and OpenAI's Whisper and uses hardware accleration with NVIDIA CUDA for both.

This is not well tested, just a quick and dirty setup for when I need to subtitle a bunch of things at once. 

To use this you'll need Docker installed, CUDA setup, and have the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) configured for your enviornment.

## To Use ## 

1. `git clone https://github.com/eldridgea/transcribe.git`
1. `cd transcribe`
1. `docker build -t transcribe .`
1. Once that's built `cd` into the directory containing the video files you want subtitled
1. `docker run --gpus all $(pwd):/whisper transcribe`
