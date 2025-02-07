#!/usr/bin/env python3
import os
import sys
import glob
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

def monitor_audio_files(prefix, sample_rate=48000, channels=1, duration=5.0, interval=500):
    # For 16-bit PCM, each sample is 2 bytes.
    bytes_per_sample = 2
    # WAV header size (typically 44 bytes) to skip.
    header_size = 44
    # Number of bytes corresponding to "duration" seconds of audio.
    window_size = int(sample_rate * duration) * channels * bytes_per_sample

    # Find all WAV files whose names start with the given prefix.
    pattern = f"{prefix}*.wav"
    files = sorted(glob.glob(pattern))
    if not files:
        print(f"No files found matching pattern '{pattern}'")
        sys.exit(1)
    
    # Create subplots: one for each file.
    n = len(files)
    if n <= 3:
        n_cols = 1
    else:
        n_cols = 2
    n_cols = 1
    n_rows = -(-n // n_cols)  # Ceiling division
    fig, axes = plt.subplots(n_rows, n_cols, figsize=(10, 3 * n), sharex=True)
    fig.canvas.manager.set_window_title("Audio Recording Monitor")
    if n == 1:
        axes = [axes]  # Ensure axes is a list when only one subplot is created.

    # Prepare a list to store each file's info and its associated plot line.
    audio_tracks = []
    for ax, file_path in zip(axes, files):
        base = os.path.basename(file_path)
        # Extract the suffix by removing the prefix and extension.
        suffix = base[len(prefix):].lstrip("_").rsplit('.', 1)[0]
        line, = ax.plot([], [], lw=2)
        ax.set_ylim(-32768, 32767)
        ax.set_xlim(0, duration)
        ax.set_ylabel("Amplitude")
        ax.set_title(f"Real-Time Audio: {suffix}")
        audio_tracks.append({
            'file': file_path,
            'line': line,
            'axis': ax,
            'suffix': suffix
        })
    # Label the shared x-axis on the bottom subplot.
    axes[-1].set_xlabel("Time [s]")

    def init():
        for track in audio_tracks:
            track['line'].set_data([], [])
        return [track['line'] for track in audio_tracks]

    def update(frame):
        lines_updated = []
        for track in audio_tracks:
            file_path = track['file']
            try:
                file_size = os.path.getsize(file_path)
            except OSError:
                continue

            # Ensure there is at least enough data for the header.
            if file_size <= header_size:
                continue

            # Calculate the size of the actual audio data (excluding the header).
            audio_data_size = file_size - header_size

            # Read the last 'window_size' bytes if available, or all of the data otherwise.
            if audio_data_size < window_size:
                with open(file_path, "rb") as f:
                    f.seek(header_size)
                    data = f.read()
            else:
                with open(file_path, "rb") as f:
                    f.seek(header_size + audio_data_size - window_size)
                    data = f.read(window_size)

            samples = np.frombuffer(data, dtype=np.int16)
            if samples.size == 0:
                continue

            # Create a time axis.
            if audio_data_size >= window_size:
                t = np.linspace(0, duration, num=len(samples))
            else:
                t = np.linspace(0, len(samples)/sample_rate, num=len(samples))

            track['line'].set_data(t, samples)
            lines_updated.append(track['line'])
        return lines_updated

    ani = animation.FuncAnimation(fig, update, init_func=init, interval=interval, blit=True, cache_frame_data=False)
    plt.tight_layout()
    plt.show()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: {} <file_prefix>".format(sys.argv[0]))
        sys.exit(1)
    prefix = sys.argv[1]
    monitor_audio_files(prefix)
