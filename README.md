# Tensorflow-object-detection instruction
1. Before serving with a GPU, in addition to installing Docker, you will need:

    Up-to-date NVIDIA drivers for your system
    nvidia-docker: You can follow the installation instructions : https://github.com/NVIDIA/nvidia-docker#quick-start

2. Docker Build 

3. RUN eg.

    docker run --runtime=nvidia \
    -e NVIDIA_VISIBLE_DEVICES=0 \
    -e PIPELINE_CONFIG=*.config \
    -e NUM_CLONES=1 \
    -it -p 8080:8080 \
    --mount type=bind,source={source_path},target={destination_path} \
    tensorflow-object-detection 
    
    Sample source_path
    
    source_path
    
      |—- pipeline.config

      ├── checkpoint

      ├── eval

      ├── pretrained_checkpoint

      └── tfrecord

            ├── test

            └── train

