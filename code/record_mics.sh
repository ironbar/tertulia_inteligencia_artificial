#!/usr/bin/env bash

# usage check
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 mic_card1 [mic_card2 …]"
    exit 1
fi

# audio settings
SR=48000            # sample rate
PERIOD_SIZE=1024    # frames per period
PERIODS=2           # periods per buffer

# timestamped output
TS=$(date +%Y%m%d-%H%M%S)
OUT="recording_${TS}.wav"

# collect background PIDs for cleanup
PIDS=()
cleanup() {
    echo "Stopping..."
    for pid in "${PIDS[@]}"; do
        kill "$pid" 2>/dev/null
    done
    exit 0
}
trap cleanup INT TERM

# 1) start JACK server under PipeWire (suppress jackctl warnings)
echo "Starting JACK server..."
export PIPEWIRE_LOG_LEVEL=0
pw-jack jackd -R -d dummy \
    -r "$SR" \
    -p "$PERIOD_SIZE" \
    -n "$PERIODS" \
    > /dev/null 2>&1 &
PIDS+=($!)
sleep 2

# 2) spawn alsa_in for each mic card, forcing mono (-c 1)
PORT_ARGS=()
for card in "$@"; do
    client="mic${card}"
    echo "Adding mic on hw:${card},0 as JACK client ‘${client}’..."
    # force this device to a single (mono) channel
    pw-jack alsa_in \
        -d "hw:${card},0" \
        -r "$SR" \
        -p "$PERIOD_SIZE" \
        -n "$PERIODS" \
        -c 1 \
        -j "$client" \
        > /dev/null 2>&1 &
    PIDS+=($!)

    # explicitly capture only channel 1 from this client
    PORT_ARGS+=(--port "${client}:capture_1")
done
sleep 2

# 3) record all ports into one multi-channel WAV
echo "Recording $# channels to $OUT"
pw-jack jack_capture --channels "$#" "${PORT_ARGS[@]}" "$OUT"

# 4) cleanup on finish or Ctrl+C
cleanup
