#!/usr/bin/env python3
import os
import argparse
from dotenv import load_dotenv
from elevenlabs.client import ElevenLabs

def transform_audio(input_path: str, output_path: str, voice_id: str):
    load_dotenv()

    client = ElevenLabs(api_key=os.getenv("ELEVENLABS_API_KEY"))

    # Open input audio file
    with open(input_path, "rb") as f:
        audio_data = f.read()

    # Call ElevenLabs Speech-to-Speech
    audio_stream = client.speech_to_speech.convert(
        voice_id=voice_id,
        audio=audio_data,
        model_id="eleven_multilingual_sts_v2",
        output_format="mp3_44100_128",
    )

    # Save to output file
    with open(output_path, "wb") as out:
        for chunk in audio_stream:
            out.write(chunk)

    print(f"✅ Transformed audio saved to {output_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Transform audio using ElevenLabs STS")
    parser.add_argument("input_path", help="Path to input audio file")
    parser.add_argument("output_path", help="Path to save the transformed audio file")
    parser.add_argument("voice_id", help="Voice ID to use for transformation")

    args = parser.parse_args()
    transform_audio(args.input_path, args.output_path, args.voice_id)
