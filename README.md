# darknet-amd

This container uses OpenCL to run darknet on AMD graphics cards. The image has only been tested using a Debian stretch (4.9.0-8-amd64) host machine with an AMD R5 230.

## Prerequisites

The host machine must have OpenCL enabled on it's graphics card. To do this simply run:
```bash
sudo apt install mesa-opencl-icd
```

You will obviously need [Docker](https://docs.docker.com/install/linux/docker-ce/debian/)

## Usage

After you pull the image you want to run the container and give it access to the graphics card, like so:

```bash
docker pull j4qfrost/darknet-amd
docker run --device /dev/dri:/dev/dri j4qfrost/darknet-amd
```