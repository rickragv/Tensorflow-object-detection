FROM tensorflow/tensorflow:1.12.0-devel-gpu-py3
LABEL maintainer=rickragv@gmail.com
RUN apt-get update && apt-get install -y \
  git
RUN pip install --upgrade pip

RUN apt-get install -y protobuf-compiler \
  python-lxml \
  python-pil \
  build-essential cmake pkg-config \
  libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
  libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
  libxvidcore-dev libx264-dev \
  libgtk-3-dev \
  libatlas-base-dev gfortran \
  python-tk
  
  
 RUN pip install Cython==0.29.2
 RUN pip install  contextlib2==0.5.5
 RUN pip install  pillow==5.4.1
 RUN pip install  lxml==4.3.0
 RUN pip install  jupyter
 RUN pip install  matplotlib==3.0.2
 RUN pip install opencv-python==3.4.0.12
  

RUN curl -OL https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip
RUN unzip protoc-3.0.0-linux-x86_64.zip -d protoc3
RUN mv protoc3/bin/* /usr/local/bin/
RUN mv protoc3/include/* /usr/local/include/


# clone the models repo

RUN git clone https://github.com/tensorflow/models.git

WORKDIR models/
RUN git reset --hard fad6075359b852b9c0a4c6f1b068790d44a6441a


WORKDIR research/

RUN protoc object_detection/protos/*.proto --python_out=.
RUN export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/slim" >> ~/.bashrc


ENTRYPOINT protoc object_detection/protos/*.proto --python_out=.
RUN export PYTHONPATH=$PYTHONPATH:/root/models/research:/root/models/research/slim 

#WORKDIR object_detection/
EXPOSE 8080

ENV PYTHONPATH=$PYTHONPATH:/root/models/research:/root/models/research/slim 
ADD script.sh script.sh
RUN ["chmod", "+x", "script.sh"]

ENTRYPOINT  sh script.sh
