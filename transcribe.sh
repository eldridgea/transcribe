mkdir .tmp
for INPUT_FILE in *avi *mpg *MPG *wmv *mp4 *m4v *mov *mkv; do
    FILENAME="${INPUT_FILE%.*}"
    echo "Extracting audio... $INPUT_FILE $FILENAME"
    ffmpeg -hwaccel cuda -hide_banner -loglevel error -i "$INPUT_FILE" -vn -acodec pcm_s16le -ar 16000 -ac 1 ".tmp/$FILENAME.en.wav"
    echo "Transcribing..."
    whisper ".tmp/$FILENAME.en.wav" --model medium --language English --task transcribe --output_format srt --output_dir /whisper --device cuda
done
