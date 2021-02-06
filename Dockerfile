from nvcr.io/nvidia/l4t-base:r32.4.3

MAINTAINER Dan Walkes (danwalkes@boulderai.com)

COPY libtensorflow-1.15-jp4.4.tar.gz /usr/lib
RUN cd /usr/lib && tar -xvf libtensorflow-1.15-jp4.4.tar.gz && rm libtensorflow-1.15-jp4.4.tar.gz && rm -rf \ 
    libtensorflow*.params && ldconfig
