# How to record

We use `arecord` to record the podcast.

On a first step check which microphones are available.

```bash
arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC257 Analog [ALC257 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Mini [Razer Seiren Mini], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
```

Then pass the ids of the microphones you want to record as arguments and press `ESC` to stop the recording.

```bash
# just one microphone
./record.sh 2
# multiple microphones
./record.sh 2 3 4
```