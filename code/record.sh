#!/bin/bash
# Improved recording script with synchronous start and pre-check
# Usage: ./record.sh mic_number1 [mic_number2 ...]

# Activate the conda environment
eval "$(conda shell.bash hook)"
conda activate tertulia

# Function to stop recording
stop_recording() {
    echo "Stopping recording..."
    for pid in "${PIDS[@]}"; do
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid"
        fi
    done
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

# Pre-check all microphones
MIC_LIST=("$@")
CHECK_PASSED=true

echo "Checking microphones..."
for mic_number in "${MIC_LIST[@]}"; do
    # Test the microphone device first
    # Attempt a quick 1-second capture to /dev/null
    if arecord -D plughw:$mic_number,0 -r 48000 -f S16_LE -d 1 /dev/null &>/dev/null; then
        echo -e "\033[32mMicrophone $mic_number: OK\033[0m"
    else
        echo -e "\033[31mError: Could not start recording from microphone $mic_number. The device may be busy or unavailable.\033[0m"
        CHECK_PASSED=false
    fi
done

if [ "$CHECK_PASSED" = false ]; then
    echo -e "\033[31mError: One or more microphones failed the pre-check. Exiting...\033[0m"
    exit 1
fi

# adjust microphone volume
echo "Adjusting microphone volume..."
for mic_number in "${MIC_LIST[@]}"; do
    amixer -c $mic_number set Mic 50%
done


# If we reached here, all microphones are OK to use
echo -e "\033[32mAll microphones are ready. Starting recording...\033[0m"

# Start recording from each specified microphone simultaneously
PIDS=()
for mic_number in "${MIC_LIST[@]}"; do
    FILENAME="${TIMESTAMP}_alsa${mic_number}.wav"
    arecord -D plughw:$mic_number,0 -r 48000 -f S16_LE "$FILENAME" &
    PIDS+=($!)
    echo "Recording from microphone $mic_number started. Saving to $FILENAME."
done
start=$SECONDS

echo "Launching recording monitor..."
python recording_monitor.py ${TIMESTAMP} &
PIDS+=($!)

# Main loop to display elapsed time and wait for ESC to stop
echo "Recording... Press ESC to stop."
while true; do
    elapsed_time=$(date -u -d @$((SECONDS - start)) +%H:%M:%S)
    echo -ne "$elapsed_time\r"
    IFS= read -r -n1 -t 1 key
    # Check if the key pressed is ESC
    if [[ $key == $'\x1b' ]]; then
        # Peek at the next input to determine if it's a sequence
        IFS= read -r -n2 -t 0.01 next_key
        if [[ -z $next_key ]]; then
            # If no additional input, it's a standalone ESC key
            echo -e "\n$elapsed_time"
            break
        fi
    fi
done

# Stop recording
stop_recording
exit 0
