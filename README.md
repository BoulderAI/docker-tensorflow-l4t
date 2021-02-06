# docker-tensorflow-l4t
A repository to build a tensorflow C++ container for L4T platforms

Used to build the docker container at https://hub.docker.com/repository/docker/baicontainers/l4t-tensorflow-cc

# Instructions

Download the zip file from https://hub.docker.com/repository/docker/baicontainers/l4t-tensorflow-cc to this directory.

Then build with the `./build.sh` script

## Hand Build Steps

Here are the steps I used to generate the files in the .tar.gz

TODO: dockerize these.

```
apt-get install -y \
openjdk-11-jdk-headless \
build-essential \
python \
python3 \
curl \
zip \
unzip \
git \

# See
https://github.com/PINTO0309/Bazel_bin/tree/b1740372eb7ca4437133a6e259114c0a40cf2f13/0.26.1/Raspbian_Debian_Buster_aarch64/openjdk-8-jdk
curl -sc /tmp/cookie
"https://drive.google.com/uc?export=download&id=1GRxgbECrXgqQvYGOg1DzYHxsPLjyk0e3"
> /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie
"https://drive.google.com/uc?export=download&confirm=${CODE}&id=1GRxgbECrXgqQvYGOg1DzYHxsPLjyk0e3"
-o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel

git clone https://github.com/BoulderAI/tensorflow.git && \
cd tensorflow && \
git checkout r1.15-jp4.4 && \
./configure
# For configuration step here use cuda = y and cuda compute 6.2
bazel build --config=v1 --config=nonccl --local_resources 2048,0.5,1.0 --verbose_failures //tensorflow:libtensorflow_cc.so
```
