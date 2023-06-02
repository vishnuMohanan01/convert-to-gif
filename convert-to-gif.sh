#!/bin/sh

set -e

DEFAULT_OUTPUT_LENGTH="20"
DEFAULT_FILTER="bicubic"
DEFAULT_WIDTH="1280"

input_path=""
output_path=""
filter="$DEFAULT_FILTER"
output_length="$DEFAULT_OUTPUT_LENGTH"
width="$DEFAULT_WIDTH"

show_usage() {
  echo "Usage: $0 -i input_file -o output_file [-t output_length] [-f filter]"
  echo
  echo "Options:"
  echo "  -i input_file       Path to the input video file."
  echo "  -o output_file      Path to the output GIF file."
  echo "  -t output_length    Duration of the output GIF in seconds. (default: $DEFAULT_OUTPUT_LENGTH)"
  echo "  -f filter           Filter to apply during scaling. (default: $DEFAULT_FILTER)"
  echo "  -w width            Width of the output GIF. (default: $DEFAULT_WIDTH)"
  echo "  -h                  Show this help message."
  echo
}

while getopts "f:i:o:t:w:h" opt; do
  case $opt in
    f) filter="$OPTARG" ;;
    i) input_path="$OPTARG" ;;
    o) output_path="$OPTARG" ;;
    t) output_length="$OPTARG" ;;
    w) width="$OPTARG" ;;
    h)
      show_usage
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_usage
      exit 1
      ;;
  esac
done

if [[ -z "$input_path" || -z "$output_path" ]]; then
    echo "Input and output file paths are required.\n
Eg: convert-to-gif -i src/videos/sample.mp4 -t 3 -o output.gif" >&2
  exit 1
fi

ffmpeg -i "$input_path" -t "$output_length" \
  -vf "fps=15,scale=$width:-1:flags=$filter,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 "$output_path"
