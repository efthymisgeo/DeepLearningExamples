#!/bin/bash

# TXT_FOLDER=$1
WAV_FOLDER=$1
# TACO_PATH=$3
MEL_FOLDER=$2
TEXT_PREPROC="transliteration_cleaners"

# echo $TACO_PATH
# echo $WAVEGLOW_PATH

for mel in ${MEL_FOLDER}/*
do
    echo $mel
    python inference.py \
        -o $WAV_FOLDER \
        -sr 16000 \
        --stft-hop-length 200 \
        --filter-length 1024 \
        --hop-length 200 \
        --win-length 800 \
        -preproc $TEXT_PREPROC \
        --custom_name \
        --sigma-infer 0.9 \
        --denoising-strength 0.01 \
        --use-griffin-lim \
        --griffin-iters 60 \
        --use-extracted-mels \
        --mel-path $mel
done