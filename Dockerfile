FROM jjanzic/docker-python3-opencv
MAINTAINER AnhQuan Nguyen <j4qfrost@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR ~

# install opencl
RUN apt-get install -y mesa-opencl-icd ocl-icd-opencl-dev

# slim down image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# install clBLAS repo
RUN git clone https://github.com/j4qfrost/clBLAS.git \
    && cd clBLAS/src && mkdir build && cd build && cmake .. \
    && make -j 4 && make install

# install darknet repo
RUN git clone https://github.com/j4qfrost/Darknet-On-OpenCL.git \
    && cd Darknet-On-OpenCL && mkdir build && cd build && cmake .. \
    && make -j 4 && cp darknet ../../darknet

CMD ./darknet
