#!/bin/bash

# Exit on error
set -e

# Create directories if they don't exist
mkdir -p data/pascal

# Download Pascal VOC 2012
echo "Downloading Pascal VOC 2012 dataset..."
wget -P data/pascal http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar

# Extract dataset
echo "Extracting dataset..."
cd data/pascal
tar -xvf VOCtrainval_11-May-2012.tar
rm VOCtrainval_11-May-2012.tar  # Clean up tar file

echo "Running baseline training..."
# Modified version of their training command for single GPU
python train_classifier.py \
    --logdir /workspace/projects/other/ada-fusion/baselines/pascal \
    --dataset pascal \
    --num-synthetic 0 \
    --synthetic-probability 0.0 \
    --num-trials 4 \
    --examples-per-class 2 \
    --use-randaugment

echo "Pascal VOC setup complete!"