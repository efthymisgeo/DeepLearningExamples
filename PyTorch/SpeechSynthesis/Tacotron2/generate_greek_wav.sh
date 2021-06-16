#!/bin/bash

TXT_FOLDER=$1
WAV_FOLDER=$2
TACO_PATH=$3
WAVEGLOW_PATH=$4
TEXT_PREPROC="transliteration_cleaners"

echo $TACO_PATH
echo $WAVEGLOW_PATH

for txt in ${TXT_FOLDER}/*
do
    python inference.py \
        -i $txt \
        -o $WAV_FOLDER \
        -sr 16000 \
        --stft-hop-length 200 \
        -preproc $TEXT_PREPROC \
        --tacotron2 $TACO_PATH \
        --waveglow $WAVEGLOW_PATH \
        --custom_name \
        --sigma-infer 0.9 \
        --denoising-strength 0.01
done