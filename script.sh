#!/bin/sh
echo $PROFILE
if [ $PROFILE = 'EVAL' ];
then
   echo "Running Eval.."
   python object_detection/eval.py \
    --logtostderr --checkpoint_dir=training/checkpoint \
    --eval_dir=training/eval \
    --pipeline_config_path=training/${PIPELINE_CONFIG} 
else
    echo "Running Train.."
    python object_detection/train.py \
    --logtostderr \
    --pipeline_config_path=training/${PIPELINE_CONFIG} \
    --train_dir=training/checkpoint \
    --num_clones=${NUM_CLONES}
fi
