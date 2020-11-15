From nvidia/cuda:8.0-devel

LABEL owner='Hao-Yu'

COPY . /root

RUN apt-get update -y

RUN apt-get install python3-pip -y

RUN pip3 install --upgrade pip

RUN pip3 install numpy

RUN pip3 install scikit-image

RUN pip3 install TFLearn

RUN pip3 install opencv-python

RUN pip3 install tensorflow==1.14.0