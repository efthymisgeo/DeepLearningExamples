mkdir -p taco_single_output

python train.py \
       -m Tacotron2 \
       -o ./taco_single_output/ \
       -lr 1e-3 \
       --epochs 1501 \
       -bs 36 \
       --weight-decay 1e-6 \
       --grad-clip-thresh 1.0 \
       --cudnn-enabled \
       --log-file nvlog.json \
       --anneal-steps 500 1000 1500 \
       --anneal-factor 0.1 \
       --load-mel-from-disk \
       --training-files=filelists/ljs_mel_text_train_filelist.txt \
       --validation-files=filelists/ljs_mel_text_val_filelist.txt
