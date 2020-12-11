#!/bin/bash

TXT_FOLDER=$1
WAV_FOLDER=$2
TACO_PATH=$3
WAVEGLOW_PATH=$4

echo $TACO_PATH
echo $WAVEGLOW_PATH

for txt in ${TXT_FOLDER}/*
do
    python inference.py \
        -i $txt \
        -o $WAV_FOLDER \
        --tacotron2 $TACO_PATH \
        --waveglow $WAVEGLOW_PATH \
        --custom_name
done