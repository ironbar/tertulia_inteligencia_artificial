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

echo "Recording... Press ESC to stop."
start=$SECONDS
while true; do
    # Display the current elapsed time
    echo -ne "$(date -u -d @$((SECONDS-start)) +%H:%M:%S)\r"
    # Read input with a timeout of 1 second
    IFS= read -r -n1 -t 1 key
    # Break the loop if ESC is pressed
    if [[ $key == $'\x1b' ]]; then  # Check for the Escape key
        break
    fi
done


# Stop recording
stop_recording
