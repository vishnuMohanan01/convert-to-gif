#!/bin/sh

if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install ffmpeg before running the script."  >&2
    exit 1
fi

sudo ln -sf "$(pwd)/convert-to-gif.sh" /usr/local/bin/convert-to-gif

echo "Setup complete! You can now use 'convert-to-gif' command to convert videos to GIF."
