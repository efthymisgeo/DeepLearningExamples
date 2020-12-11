# *****************************************************************************
# script which plots the loss function based on the nvidia logger .json file
#  author: efthygeo 2020
#  contact: open issue
# *****************************************************************************

import os
import sys
import json
import argparse
import matplotlib.pyplot as plt 


KEEP_NAMES = ["train_loss", "val_loss"]


def clean_line(line, prefix="DLLL "):
    """function which clean a line form a given prefix"""
    return line.replace(prefix, "")


def clean_json(path, skip=39, max_epochs=1502):
    """
    Function which cleans the log file by getting only the lines every time
    an epoch ends.
    Args:
        path (str): the path to nvlog.json
        skip (int): #lines to skip in the beginning
        max_epochs (int): max #epochs
    Returns:
        (list) a list with the epoch ids
        (dict) a dict with keys "train_loss" and "val_loss" and keys their
            corresponding values
    """
    with open(path) as fd:
        f = fd.readlines()[skip:]
        # nvlog = json.load(fd.readlines()[skip:])

    epochs = []
    loss = {"train_loss": [], "val_loss": []}
    for line in f:
        tmp_line = json.loads(clean_line(line))
        if len(tmp_line["step"]) == 1:
            epoch_id = tmp_line["step"][0]
            data_name = list(tmp_line["data"].keys())[0]
            data_value = tmp_line["data"][data_name]
            if epoch_id not in epochs:
                epochs.append(epoch_id)
            if data_name in KEEP_NAMES:
                loss[data_name].append(data_value)

    return epochs, loss



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-lp", "--log_path", required=True,
                        help="path to log file")
    parser.add_argument("--skip", required=False, default=39,
                        help="Lines to skip in the beginning")
    parser.add_argument("--max_epochs", required=False, default=1502,
                       help="max epochs of network training")
    parser.add_argument("--title", type=str, required=False, default="Tacotron2",
                       help="the title of the figure")

    args = parser.parse_args()
    path = args.log_path
    skip = args.skip
    max_epochs = args.max_epochs
    header = args.title

    epochs, loss = clean_json(path, skip=skip, max_epochs=max_epochs)

    plt.figure()
    plt.plot()
    plt.xlabel("Epochs")
    plt.ylabel("Loss")
    train_loss,  =  plt.plot(epochs, loss["train_loss"], label="train loss")
    val_loss,  = plt.plot(epochs, loss["val_loss"], label="val_loss")
    train_legend = plt.legend(handles=[train_loss, val_loss],
                              loc="upper right")
    plt.title(f"Custon {header} Loss (EN)")
    plt.grid(b=True, which='major', color='#666666', linestyle='--')
    plt.minorticks_on()
    plt.grid(b=True, which='minor', color='#999999', linestyle='--', alpha=0.2)
    plt.savefig(f"{header}_en_custom_loss.png")
    plt.savefig(f"{header}_en_custom_loss.pdf")
