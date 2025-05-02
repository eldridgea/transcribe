FROM python:3.9.9
WORKDIR /whisper
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN apt update && apt install -y ffmpeg
RUN pip install setuptools-rust
RUN pip install -U openai-whisper
COPY transcribe.sh /
CMD ["whisper"]
