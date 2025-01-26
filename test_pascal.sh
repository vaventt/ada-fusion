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
    --logdir ./pascal-baselines/randaugment \
    --dataset pascal \
    --num-synthetic 0 \
    --synthetic-probability 0.0 \
    --num-trials 4 \
    --examples-per-class 2 \
    --use-randaugment

python train_classifier.py --logdir ./pascal-baselines/da-fusion-their-tokens \
--synthetic-dir "./pascal-baselines/da-fusion-aug/{dataset}-{seed}-{examples_per_class}" \
--dataset pascal --prompt "a photo of a {name}" \
--aug textual-inversion textual-inversion textual-inversion textual-inversion \
--guidance-scale 7.5 7.5 7.5 7.5 \
--strength 1.0 0.75 0.5 0.25 \
--mask 0 0 0 0 \
--inverted 0 0 0 0 \
--probs 0.25 0.25 0.25 0.25 \
--compose parallel --num-synthetic 10 --synthetic-probability 0.5 \
--num-trials 4 --examples-per-class 2 --use-randaugment

echo "Pascal VOC setup complete!"