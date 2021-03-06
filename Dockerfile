From nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

LABEL owner='Hao-Yu'

WORKDIR /root

COPY . /root

# Get required packages

#RUN apt-get update -y

#RUN apt-get install python-pip -y

RUN apt-get update && \
  apt-get install vim \
                  python-pip \
                  python-dev \
                  python-opencv \
                  python-tk \
                  libjpeg-dev \
                  libfreetype6 \
                  libfreetype6-dev \
                  zlib1g-dev \
                  cmake \
                  wget \
                  cython \
                  git \
                  -y

RUN pip install --upgrade pip

# Get required python modules

RUN pip install numpy

RUN pip install scikit-image

RUN pip install TFLearn

RUN pip install jupyter

RUN pip install image \
                scipy \
                matplotlib \
                PyYAML \
                numpy \
                easydict \
                tensorflow-gpu==1.14.0
# Update numpy
RUN pip install -U numpy

# Add CUDA to the path
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
ENV CUDA_HOME /usr/local/cuda
#RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
RUN export CUDA_HOME=/usr/local/cuda
RUN export PATH=/usr/local/cuda/bin:$PATH
RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64:"$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
#RUN export CUDA_ROOT=/usr/local/cuda-8.0
#RUN echo "CUDA_ROOT=/usr/local/cuda-8.0" >> ~/.bashrc

#RUN echo "CUDA_ROOT=/usr/local/cuda-8.0" >> ~/.bashrc

RUN cd /usr/local/lib/python2.7/dist-packages/tensorflow/ && ln -s libtensorflow_framework.so.1 libtensorflow_framework.so

RUN cd external && make clean && make

#ENV PYTHONPATH /root/coco/PythonAPI
RUN ldconfig