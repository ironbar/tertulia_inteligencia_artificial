import os
import glob
import argparse
from tqdm import tqdm
from voice_changer import transform_audio


def main(input_folder: str, output_folder: str, voice_id: str):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    filepaths = sorted(glob.glob(os.path.join(input_folder, '*.mp3')))
    for filepath in tqdm(filepaths, desc="Processing audio files"):
        filename = os.path.basename(filepath)
        output_path = os.path.join(output_folder, filename)
        transform_audio(filepath, output_path, voice_id)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Transform audio using ElevenLabs STS")
    parser.add_argument("input_folder", help="Path to input audio folder")
    parser.add_argument("output_folder", help="Path to save the transformed audio files")
    parser.add_argument("--voice_id", required=False, help="Voice ID to use for transformation", default="Nh2zY9kknu6z4pZy6FhD")
    args = parser.parse_args()
    main(args.input_folder, args.output_folder, args.voice_id)
