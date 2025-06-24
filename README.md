# yt-dlp Download Script with Options

## Description

This project provides a flexible Bash script for downloading audio or video content from YouTube and many other supported platforms using yt-dlp.
It includes interactive prompts for format selection, download mode (single URL or batch from a file), and automatically organizes files into ~/Music or ~/Videos.
The script also avoids duplicate downloads by keeping a history log and is designed for easy reuse and portability.

It supports:

- Downloading audio or video.
- Selecting audio format (`mp3`, `flac`, `opus`).
- Avoiding duplicate downloads with a download archive.
- Reading URLs from a file or a single URL input.
- Saving downloads to predefined folders (`~/Music` for audio, `~/Videos` for video).
- Easy configuration with interactive prompts.

---

## Usage

1. Clone or download this repository.  
2. Make sure `yt-dlp` and `ffmpeg` are installed on your system.  
3. Make the script executable:

   ```bash
   chmod +x script_yt-dlp_with_options.sh
