# *****************************************************************************
# script which plots the spectrograms as extracted by the nvidia repo
#  author: efthygeo 2020
#  contact: 
# *****************************************************************************

import os
import numpy as np
import sys
import torch
import argparse
import librosa
import matplotlib.pyplot as plt 


def plot_mel_spectrogram(mel_path, title=None,
                         ylabel='mel-freq',
                         aspect='auto',
                         xmax=None,
                         dirname="cleaned_mel_specs",
                         append_name=False,
                         load_mel_path=True):
    fig, axs = plt.subplots(1, 1)
    axs.set_title(title or 'Spectrogram (db)')
    axs.set_ylabel(ylabel)
    axs.set_xlabel('frame')
    
    # mel = mel_path.detach().cpu().numpy()
    # if load_mel_path:
    #     mel = torch.load(mel_path)
    # else:
    #     mel = np.load(mel_path)
        # mel = mel.squeeze(0)
        # mel = mel.detach().cpu().numpy()

    # NOTE: uncomment for old version
    mel = mel_path.squeeze(0)
    mel = mel.detach().cpu().numpy()
    # mel_DB = librosa.power_to_db(mel)
    # mel_DB = librosa.amplitude_to_db(mel)
    im = axs.imshow(mel, origin='lower', aspect=aspect)
    if xmax:
        axs.set_xlim((0, xmax))
    fig.colorbar(im, ax=axs)
    # plt.show(block=False)
    if append_name:
        mel_name = dirname + title
    else:
        mel_name = os.path.join(dirname, title)
    print(f"Saving at {mel_name}")
    plt.savefig(f"{mel_name}_meldb.png")
    plt.savefig(f"{mel_name}_meldb.pdf")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-mel", "--mel_path", required=True,
                        help="path to log file")
    parser.add_argument("-o", "--out_dir", required=True,
                        help="path to save directory")

    args = parser.parse_args()
    mel_path = args.mel_path
    header = (mel_path.split("/")[-1]).split(".pt")[0]

    plot_mel_spectrogram(mel_path, title=header, dirname=args.out_dir, load_mel_path=False)

    # plt.figure()
    # plt.plot()
    # plt.xlabel("Epochs")
    # plt.ylabel("Loss")
    # train_loss,  =  plt.plot(epochs, loss["train_loss"], label="train loss")
    # val_loss,  = plt.plot(epochs, loss["val_loss"], label="val_loss")
    # train_legend = plt.legend(handles=[train_loss, val_loss],
    #                           loc="upper right")
    # plt.title(f"Custon {header} Loss (EN)")
    # plt.grid(b=True, which='major', color='#666666', linestyle='--')
    # plt.minorticks_on()
    # plt.grid(b=True, which='minor', color='#999999', linestyle='--', alpha=0.2)
    # plt.savefig(f"{header}_gr_custom_loss.png")
    # plt.savefig(f"{header}_gr_custom_loss.pdf")
