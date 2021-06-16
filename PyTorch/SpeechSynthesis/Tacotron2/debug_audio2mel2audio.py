import numpy as np
import argparse
import torch

from tacotron2.data_function import TextMelLoader
from common.utils import load_filepaths_and_text
from common.utils import load_wav_to_torch

from scipy.io.wavfile import write
from common.stft import STFT
# from common.audio_processing import griffin_lim
import torchaudio.transforms as T


def parse_args(parser):
    """
    Parse commandline arguments.
    """
    parser.add_argument('-d', '--dataset-path', type=str,
                        default='./', help='Path to dataset')
    parser.add_argument('--wav-files', required=True,
                        type=str,
                        help='Path to filelist with audio paths and text')
    parser.add_argument('--mel-files', required=True,
                        type=str,
                        help='Path to filelist with mel paths and text')
    parser.add_argument('--text-cleaners', nargs='*',
                        default=['english_cleaners'], type=str,
                        help='Type of text cleaners for input text')
    parser.add_argument('--max-wav-value', default=32768.0, type=float,
                        help='Maximum audiowave value')
    parser.add_argument('--sampling-rate', default=22050, type=int,
                        help='Sampling rate')
    parser.add_argument('--filter-length', default=1024, type=int,
                        help='Filter length')
    parser.add_argument('--hop-length', default=256, type=int,
                        help='Hop (stride) length')
    parser.add_argument('--win-length', default=1024, type=int,
                        help='Window length')
    parser.add_argument('--mel-fmin', default=0.0, type=float,
                        help='Minimum mel frequency')
    parser.add_argument('--mel-fmax', default=8000.0, type=float,
                        help='Maximum mel frequency')
    parser.add_argument('--n-mel-channels', default=80, type=int,
                        help='Number of bins in mel-spectrograms')
    parser.add_argument('--n-iters', default=32, type=int,
                        help='Number of Griffin-Lim iterations')
    return parser


def audio2mel2audio(dataset_path,
                    audiopaths_and_text,
                    melpaths_and_text,
                    args,
                    use_intermed=None):

    melpaths_and_text_list = \
        load_filepaths_and_text(dataset_path, melpaths_and_text)

    audiopaths_and_text_list = \
        load_filepaths_and_text(dataset_path, audiopaths_and_text)

    # n = 10
    # print(f"The first {n} melpaths and text are {melpaths_and_text_list[:n]}")
    # print(f"The first {n} audiopaths and text are {audiopaths_and_text_list[:n]}")

    # torchaudio implementation
    spec = T.Spectrogram(
            n_fft=args.filter_length,
            win_length=args.win_length,
            hop_length=args.hop_length,
            power=1,
            normalized=True,

        )
    # print(spec)

    griffin_lim = T.GriffinLim(
            n_fft=args.filter_length,
            win_length=args.win_length,
            hop_length=args.hop_length,
            n_iter=args.n_iters,
            power=1,
            normalized=True,
        )
    # import pdb; pdb.set_trace()
    print(args)
    data_path = "/data/logotypografia_simple/cleaned_wavs/"

    #  tacotron-based implementations
    # stft_fn = STFT(args.filter_length, args.hop_length, args.win_length)
    # data_loader = TextMelLoader(dataset_path, audiopaths_and_text, args)
    for i in range(len(melpaths_and_text_list)):
        # specotrogram calculation based on internal components, buggy
        # spec = data_loader.get_spec(audiopaths_and_text_list[i][0])
        # wave = griffin_lim(spec, stft_fn, n_iters=30)
        # wave = wave.detach().cpu().numpy()

        #  spectrogram calculation based on torchaudio
        wav_name = data_path + audiopaths_and_text_list[i][0].split("/")[-1]

        audio, sampling_rate = load_wav_to_torch(wav_name)

        _spectrogram = spec(audio)
        inv_waveform = griffin_lim(_spectrogram)

        # torch.save(mel, f"grifin_lin/{}")
        inv_wav_name = "griffin_lim_inv_audio_custom7/" \
                       + audiopaths_and_text_list[i][0].split("/")[-1]
        print(f"Saving reconstructed wav with name {inv_wav_name}")
        write(inv_wav_name, 16000, inv_waveform.detach().cpu().numpy())


def main():
    parser = argparse.ArgumentParser(description='PyTorch Tacotron 2 Training')
    parser = parse_args(parser)
    args = parser.parse_args()
    args.load_mel_from_disk = False
    print(f"Sampling rate is {args.sampling_rate}")

    audio2mel2audio(args.dataset_path, args.wav_files, args.mel_files, args)


if __name__ == '__main__':
    main()
