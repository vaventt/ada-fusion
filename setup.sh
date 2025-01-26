#!/bin/bash

# Exit on error
set -e

echo "Creating conda environment..."

# Create conda environment with Python 3.8 (more stable than 3.7)
conda create -n ada-fusion python=3.8 -y

# Activate environment
source activate ada-fusion

# Install PyTorch with CUDA support (using conda for better CUDA integration)
conda install pytorch==2.1.0 torchvision==0.16.0 pytorch-cuda=12.1 -c pytorch -c nvidia -y

# Install other dependencies via pip
pip install diffusers["torch"] transformers pycocotools pandas matplotlib seaborn scipy

# Install the local package in development mode
pip install -e .

echo "Installation complete! Activate the environment with: conda activate ada-fusion"