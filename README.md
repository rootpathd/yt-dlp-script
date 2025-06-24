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
## 📁 Installation
## 1. Clone the repository:
      git clone https://github.com/rootpathd/yt-dlp-script.git
      cd yt-dlp-script
      
## 2. Move the script to your personal scripts folder:
      mkdir -p ~/scripts
      cp script_yt-dlp_with_options.sh ~/scripts/
      chmod +x ~/scripts/script_yt-dlp_with_options.sh
   
## 3. (Optional) Add a permanent alias for easier use:
      ## Edit your ~/.zshrc
      vim ~/.zshrc
      ## Add this line at the bottom:
      alias alias_name="$HOME/scripts/script_yt-dlp_with_options.sh"
      ## Apply the changes:
      source ~/.zshrc

## ▶️ Usage
Run the script with:
alias_name
Then follow the prompts:
1. Choose between downloading a single video or using a file with multiple URLs.
2. Choose whether to download audio or full video.
3. If audio, choose your preferred format (mp3, flac, m4a, opus).
  - 🎶 Audio files will be saved to ~/Music
  - 🎥 Videos will be saved to ~/Videos
  - ✅ The script avoids duplicate downloads using --download-archive.

## 📄 Example of a file with multiple URLs
      Create a text file like this:
      txt
      https://www.youtube.com/watch?v=abc123
      https://www.youtube.com/watch?v=def456
      Then run:
      alias_name
      And choose the file option when prompted.

## 🔧 Customization
You can edit the script to change default directories (~/Music, ~/Videos) or add other yt-dlp options if needed.
