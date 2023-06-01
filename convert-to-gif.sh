#!/bin/sh

set -e

input_path=""
output_path=""
output_length=3

while getopts "i:o:t:" opt; do
  case $opt in
    i)
      input_path="$OPTARG"
      ;;
    o)
      output_path="$OPTARG"
      ;;
    t)
      output_length="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [[ -z $input_path || -z $output_path ]]; then
    echo "Input and output file paths are required.

Eg: convert-to-gif -i src/videos/sample.mp4 -t 3 -o output.gif" >&2
  exit 1
fi

ffmpeg -i $input_path -t $output_length \
    -vf "fps=15,scale=1280:-1:flags=bicubic,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 $output_path
