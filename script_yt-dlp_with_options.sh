#!/bin/bash

# === Interactive script to download audio or video from YouTube using yt-dlp ===

ARCHIVE_FILE="$HOME/.config/yt-dlp/downloaded.txt"
mkdir -p "$(dirname "$ARCHIVE_FILE")"

echo "🔽 Do you want to download a single URL or multiple URLs from a file?"
echo "1) Single URL"
echo "2) From a file with URLs"
read -p "Choose an option (1-2): " MODE

if [[ "$MODE" == "1" ]]; then
  read -p "📺 Enter the YouTube video URL: " URL
  SOURCE="$URL"
elif [[ "$MODE" == "2" ]]; then
  read -p "📄 Enter the path to the file containing URLs (one per line): " URL_FILE
  if [[ ! -f "$URL_FILE" ]]; then
    echo "❌ File not found: $URL_FILE"
    exit 1
  fi
  SOURCE="$URL_FILE"
else
  echo "❌ Invalid option"
  exit 1
fi

echo "🎬 What would you like to download?"
echo "1) Audio only"
echo "2) Full video"
read -p "Choose an option (1-2): " TYPE

if [[ "$TYPE" == "1" ]]; then
  echo "🎧 Choose the audio format:"
  echo "1) mp3"
  echo "2) flac"
#  echo "3) m4a"
#  echo "4) opus"
  read -p "Choose an option (1-2): " FORMAT_CHOICE

  case "$FORMAT_CHOICE" in
    1) AUDIO_FORMAT="mp3" ;;
    2) AUDIO_FORMAT="flac" ;;
#    3) AUDIO_FORMAT="m4a" ;;
#    4) AUDIO_FORMAT="opus" ;;
    *) echo "❌ Invalid choice. Defaulting to mp3."; AUDIO_FORMAT="mp3" ;;
  esac

  OUTPUT_DIR="$HOME/Música"
  mkdir -p "$OUTPUT_DIR"

  yt-dlp -x \
    --audio-format "$AUDIO_FORMAT" \
    --audio-quality 0 \
    --embed-thumbnail \
    --add-metadata \
    --download-archive "$ARCHIVE_FILE" \
    -o "$OUTPUT_DIR/%(title)s.%(ext)s" \
    "$SOURCE"

  echo "✅ Audio file(s) saved in: $OUTPUT_DIR"

elif [[ "$TYPE" == "2" ]]; then
  OUTPUT_DIR="$HOME/Vídeos"
  mkdir -p "$OUTPUT_DIR"

  yt-dlp \
    -f bestvideo+bestaudio \
    --merge-output-format mp4 \
    --embed-thumbnail \
    --add-metadata \
    --download-archive "$ARCHIVE_FILE" \
    -o "$OUTPUT_DIR/%(title)s.%(ext)s" \
    "$SOURCE"

  echo "✅ Video file(s) saved in: $OUTPUT_DIR"

else
  echo "❌ Invalid option"
  exit 1
fi
