# *****************************************************************************
#  ATHENA RC
#  maintainer: efthygeo
# *****************************************************************************

import os
import sys
import json
import argparse


def make_txt(name, text):
    "store the given text to name.txt"
    fd = open(name+".txt", "w+")
    fd.write(text)
    fd.close()
    return


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', type=str, required=True,
                        help='full path to the input .json file (keys:phrases, values:ids)')
    parser.add_argument('-o', '--output', type=str, required=True,
                        help='output folder to save id.txt for every id')
    kripis_parser = parser.parse_args()
    in_json = kripis_parser.input
    out_folder = kripis_parser.output

    with open(in_json) as fd:
        phrase2id_map = json.load(fd)
    id2phrase_map = {v: k for k, v in phrase2id_map.items()}

    for idx, txt in id2phrase_map.items():
        make_txt(os.path.join(out_folder, str(idx)), txt)
     

