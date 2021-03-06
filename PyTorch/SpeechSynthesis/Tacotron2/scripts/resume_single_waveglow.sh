python train.py \
    -m WaveGlow \
    -o waveglow_single_output/ \
    --amp \
    -lr 1e-4 \
    --epochs 1001 \
    -bs 7 \
    --segment-length 8000 \
    --weight-decay 0 \
    --grad-clip-thresh 65504.0 \
    --cudnn-benchmark \
    --cudnn-enabled \
    --load-mel-from-disk\
    --log-file nvlog.json\
    --resume-from-last
