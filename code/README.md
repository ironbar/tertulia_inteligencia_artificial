# How to record

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

Then pass the ids of the microphones you want to record as arguments and press `ENTER` to stop the recording. The recordings are saved on the same folder as the recording script. Please run the recording script within a python environment with numpy and matplotlib to be able to visualize the recording in real-time. Otherwise the recording will work just fine but you won't be able to visualize that everything is ok.

```bash
# just one microphone
./record_mics.sh 2
# multiple microphones
./record_mics.sh 2 3 4
```

TODO: adjusting the microphone volume might not work in all computers

### Environment

```
conda create -n tertulia python=3.10
conda activate tertulia
pip install numpy matplotlib ipykernel ipywidgets scikit-image librosa tqdm samplerate
conda install -c conda-forge 'libgcc-ng>=13' 'libstdcxx-ng>=13'
```
