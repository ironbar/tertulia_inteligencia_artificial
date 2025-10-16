from pydub import AudioSegment, silence
import os
import sys

# Check command line arguments
if len(sys.argv) != 3:
    print("Usage: python crop_audio.py <input_path> <output_dir>")
    sys.exit(1)

# Paths from command line arguments
input_path = sys.argv[1]
output_dir = sys.argv[2]

# Create output directory
os.makedirs(output_dir, exist_ok=True)

# Load audio
audio = AudioSegment.from_file(input_path)

# Target duration range in ms
min_duration = 4 * 60 * 1000
max_duration = 5 * 60 * 1000

# Variables
start = 0
counter = 1
segments = []

while start < len(audio):
    end = min(start + max_duration, len(audio))
    segment = audio[start:end]

    # Find silence near the end of the segment (within last 30s)
    silence_points = silence.detect_silence(
        segment[-30000:], min_silence_len=500, silence_thresh=segment.dBFS - 16
    )

    if silence_points:
        # Adjust crop to the first silence point
        silence_start = (silence_points[0][0] + silence_points[0][1]) // 2
        end = start + len(segment) - 30000 + silence_start

    # Ensure segment is at least min_duration long (unless at the end)
    if end - start < min_duration and end != len(audio):
        end = min(start + min_duration, len(audio))

    # Export segment
    out_path = os.path.join(output_dir, f"segment_{counter}.mp3")
    audio[start:end].export(out_path, format="mp3")
    segments.append(out_path)

    start = end
    counter += 1
