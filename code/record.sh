#!/bin/bash
# https://chat.openai.com/share/9bd4c8a3-5dcf-46cd-b881-bf4e6f9c9929
# https://chat.openai.com/c/19aabed3-64d8-44ce-897c-e2b4775abd65
# On a first step check where the microphones are
# arecord -l 
# Then launch the recording
# ./record.sh 2 3 4 5 6

# Function to stop recording
stop_recording() {
    echo "Stopping recording..."
    kill $PIDS
}

# Check if at least one microphone number is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 mic_number1 [mic_number2 ...]"
    exit 1
fi

# Generate a timestamp
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

# Trap INT and TERM signals to stop recording gracefully
trap 'stop_recording; exit 0' INT TERM

# Start recording from each specified microphone
PIDS=()
for mic_number in "$@"; do
    FILENAME="${TIMESTAMP}_alsa${mic_number}.wav"
    arecord -D plughw:$mic_number,0 -r 48000 -f S16_LE "$FILENAME" &
    PIDS+=($!)
    echo "Recording from microphone $mic_number started. Saving to $FILENAME."
done

echo "Recording... Press CTRL+C to stop."

# Wait for the user to press ENTER
while IFS= read -r -n1 key
do
    # Break if Enter is pressed (ASCII code for Enter is 13)
    if [[ $key == $'\x0d' ]]; then
        break
    fi
done

# Stop recording
stop_recording
