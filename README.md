
# Tensorflow-object-detection instruction
1. Before running with a GPU, in addition to installing Docker, you will need:
    Up-to-date NVIDIA drivers for your system
    **nvidia-docker**: You can follow the installation instructions : **https://github.com/NVIDIA/nvidia-docker#quick-start**

2. Docker Build 

3. RUN docker image.
	This docker can be run for training and evalutaion of model, by quickly setting environment variable - PROFILE to EVAL (for evaluation) and default is training.
	
	**To run for training:**
	
	    docker run --runtime=nvidia \
	    -e NVIDIA_VISIBLE_DEVICES=0 \ 
	    -e PIPELINE_CONFIG=*.config \  
	    -e NUM_CLONES=1 \  
	    -it -p 8080:8080 \
	    --mount type=bind,source={source_path},target=/root/models/research/training \
	    tensorflow-object-detection 

	**To run for evalutation:**
	
	    docker run --runtime =nvidia \
	    -e NVIDIA_VISIBLE_DEVICES =0 \ 
	    -e PIPELINE_CONFIG =*.config \  
	    -e NUM_CLONES =1 \
	     -e PROFILE = EVAL \
	     -it -p 8080:8080 \
	    --mount type=bind,source={source_path},target=/root/models/research/training \
	    tensorflow-object-detection 
    
    Directory Structure for source_path 
		    source_path
    
	      |—- pipeline.config

	      ├── checkpoint

	      ├── eval

	      ├── pretrained_checkpoint

	      └── tfrecord

	            ├── test

	            └── train

**example: pipeline.config relative paths**
```
1. fine_tune_checkpoint:"./training/pretrained_checkpoint/model.ckpt"
2. train_input_reader: {
		  tf_record_input_reader {
		    input_path: "./training/tfrecord/train/*.record
		  }

		  label_map_path: "./training/label_map.pbtxt"
		}
3. eval_input_reader: {
		  tf_record_input_reader {
		    input_path: "./training/tfrecord/test/*.record"
		  }

		  label_map_path: "./training/label_map.pbtxt"

		}
```
