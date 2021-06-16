#!/bin/bash
bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_15_gr_waveglow_15 \
                           gr_tacotron_new/checkpoint_Tacotron2_15.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_15_gr_waveglow_30 \
                           gr_tacotron_new/checkpoint_Tacotron2_15.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_15_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_15.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_45_gr_waveglow_15 \
                           gr_tacotron_new/checkpoint_Tacotron2_45.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_45_gr_waveglow_30 \
                           gr_tacotron_new/checkpoint_Tacotron2_45.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_30_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_30.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_45_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_45.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_60_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_60.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_75_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_75.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_90_gr_waveglow_45 \
                           gr_tacotron_new/checkpoint_Tacotron2_90.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_90_en_waveglow \
                           gr_tacotron_new/checkpoint_Tacotron2_90.pt \
                           trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_75_en_waveglow \
                           gr_tacotron_new/checkpoint_Tacotron2_75.pt \
                           trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_60_en_waveglow \
                           gr_tacotron_new/checkpoint_Tacotron2_60.pt \
                           trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_45_en_waveglow \
                           gr_tacotron_new/checkpoint_Tacotron2_45.pt \
                           trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_en_taco_gr_waveglow_45 \
                           trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
                           gr_waveglow_new/checkpoint_WaveGlow_45.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_en_taco_gr_waveglow_30 \
                           trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_en_taco_gr_waveglow_15 \
                           trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_60_gr_waveglow_15 \
                           gr_tacotron_new/checkpoint_Tacotron2_60.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_60_gr_waveglow_30 \
                           gr_tacotron_new/checkpoint_Tacotron2_60.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_75_gr_waveglow_15 \
                           gr_tacotron_new/checkpoint_Tacotron2_75.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_75_gr_waveglow_30 \
                           gr_tacotron_new/checkpoint_Tacotron2_75.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_90_gr_waveglow_15 \
                           gr_tacotron_new/checkpoint_Tacotron2_90.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_15.pt

bash generate_greek_wav.sh greek_train_phrases \
                           v2_train_set_gr_taco_90_gr_waveglow_30 \
                           gr_tacotron_new/checkpoint_Tacotron2_90.pt \
                           gr_waveglow_new/checkpoint_WaveGlow_30.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_300_gr_waveglow_300 \
#                            gr_tacotron/checkpoint_Tacotron2_300.pt \
#                            gr_waveglow/checkpoint_WaveGlow_300.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_500_gr_waveglow_300 \
#                            gr_tacotron/checkpoint_Tacotron2_500.pt \
#                            gr_waveglow/checkpoint_WaveGlow_300.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_150_gr_waveglow_200 \
#                            gr_tacotron/checkpoint_Tacotron2_150.pt \
#                            gr_waveglow/checkpoint_WaveGlow_200.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_300_gr_waveglow_200 \
#                            gr_tacotron/checkpoint_Tacotron2_300.pt \
#                            gr_waveglow/checkpoint_WaveGlow_200.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_500_gr_waveglow_200 \
#                            gr_tacotron/checkpoint_Tacotron2_500.pt \
#                            gr_waveglow/checkpoint_WaveGlow_200.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_150_gr_waveglow_100 \
#                            gr_tacotron/checkpoint_Tacotron2_150.pt \
#                            gr_waveglow/checkpoint_WaveGlow_100.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_300_gr_waveglow_100 \
#                            gr_tacotron/checkpoint_Tacotron2_300.pt \
#                            gr_waveglow/checkpoint_WaveGlow_100.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_500_gr_waveglow_100 \
#                            gr_tacotron/checkpoint_Tacotron2_500.pt \
#                            gr_waveglow/checkpoint_WaveGlow_100.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_150_en_waveglow \
#                            gr_tacotron/checkpoint_Tacotron2_150.pt \
#                            trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_300_en_waveglow \
#                            gr_tacotron/checkpoint_Tacotron2_300.pt \
#                            trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

# bash generate_greek_wav.sh greek_train_phrases \
#                            train_set_gr_taco_500_en_waveglow \
#                            gr_tacotron/checkpoint_Tacotron2_500.pt \
#                            trained_models/waveglow/nvidia_waveglowpyt_fp32_20190306.pth

# bash generate_greek_wav.sh greek_train_phrases \
#                            en_taco_gr_waveglow_300 \
#                            trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
#                            gr_waveglow/checkpoint_WaveGlow_300.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            en_taco_gr_waveglow_200 \
#                            trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
#                            gr_waveglow/checkpoint_WaveGlow_200.pt

# bash generate_greek_wav.sh greek_train_phrases \
#                            en_taco_gr_waveglow_100 \
#                            trained_models/tacotron_2/nvidia_tacotron2pyt_fp32_20190306.pth \
#                            gr_waveglow/checkpoint_WaveGlow_100.pt
