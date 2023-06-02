# convert-to-gif

## Installation

To install the application, please ensure that you have `ffmpeg` installed on your system. If `ffmpeg` is not already installed, you can follow the [instructions](https://ffmpeg.org/download.html) specific to your operating system to install it.

Once ffmpeg is installed, you can proceed with the following steps:

1. Clone the repository by running the command:

```bash
 git clone https://github.com/vishnuMohanan01/convert-to-gif.git
```

2. Change your current directory to the cloned repository by running:

```bash
cd convert-to-gif
```

3. Set the right file permissions for the setup script and run the script.

```bash
chmod +x setup.sh

# Run the script
./setup.sh
```

## Usage

```bash
convert-to-gif -i ~/Desktop/input.mov -o output.gif

# Use -t flag for set the duration of output gif in seconds, default value is 20s
convert-to-gif -i ~/Desktop/input.mov -o output.gif -t 4

# Use -w flag to set the width of output gif, default value is 1280
convert-to-gif -i ~/Desktop/input.mov -o output.gif -w 640

# Use -h flag to show help message
convert-to-gif -h
```

## Sample gif

![Sample converted gif](https://github.com/vishnuMohanan01/convert-to-gif/blob/main/assets/output.gif)
