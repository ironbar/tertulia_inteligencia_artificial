# How to edit the podcast

## Step 1. align the audios

Rename the audios to the name of the people talking for easier edit.

On a first step load the audios with audacity, align with initial clapeta and then check the missalignment on the last clapeta.
Using that information the audios are modified to reach perfect alignment.

2 gbarbadillo +3ms
3 jgoros 1h21m10s
4 vgoni +11ms

```python
# conda activate tertulia
# ipython
import os
import librosa
import soundfile as sf
import numpy as np

def shorten_audio(filepath, offset_ms, duration_s):
    y, sr = librosa.load(filepath, sr=None)
    samples_to_drop = 1
    samples_to_keep = duration_s*1000//offset_ms
    print(f'One sample will be drop every {samples_to_keep}')
    total_samples = len(y)
    index = np.delete(np.arange(total_samples), np.arange(0, total_samples, samples_to_keep))
    y_reduced = y[index]
    sf.write('_reduced'.join(os.path.splitext(filepath)), y_reduced, sr)

duration = int((81)*60 + 10)
shorten_audio('gbarbadillo.wav', offset_ms=3, duration_s=duration)
shorten_audio('vgoni.wav', offset_ms=11, duration_s=duration)
```

Open the audios again on Audacity and align them, alignment should be perfect.
Export multiple to a new folder called `aligned_audios`.

## Step 2. Merge the audios

At the end of this step we are going to have a single track, saved in a folder called `curated_audios` and named as `v0.wav`. The goal is to make sure all the tracks have the same volume and to remove the echo.

- Visualize all the tracks with Half wave
- Amplify the tracks to have a peak amplitude around 5dB when the person is talking. Sometimes we have to do it for different sections for a person
- Mix and render to new track to see if the volume is uniform

If there is echo we have to silence the background noise on the noisier track. We can do this manually or using the AutoDuck filter.

## Step 3. Enhance

- Remove parts of the episode whith fails
- Reorder the episode if necessary (if we record the intro at the end)
- Truncate silence, -30 dB, 1 second, 1 second (adjust the noise threshold if necessary)
- Compressor, Threshold -20 dB, Noise Floor -60 dB, Ratio 3:1, attack time 0.2s, release time 1s

## Step 4. Add music to the podcast

We currently add the following music:

- intro
- lofi music for background
- outro

I use Adjustable Fade, in and out to have smooth transitions between music

## Step 5. Whisper and review

Transcribir el audio con whisper, leer y revisar con ChatGPT.

<https://colab.research.google.com/drive/116xttWEnyPZXw9Kpccc7tJJ1gKvdy04w#scrollTo=gJls1q0pXUHF>

## Step 6. Description and miniature

Description template:

```
Rabbit R1 y OpenAI denunciado por Copyright

Analizamos el lanzamiento de Rabbit R1 y la denuncia del New York Times contra OpenAI por copyright.

Participan en la tertulia: Paco Zamora, Íñigo Olcoz, Carlos Larríu, Víctor Goñi y Guillermo Barbadillo.

Recuerda que puedes enviarnos dudas, comentarios y sugerencias en: https://twitter.com/TERTUL_ia

Más info en: https://ironbar.github.io/tertulia_inteligencia_artificial/

Este episodio ha sido patrocinado por Veridas: https://veridas.com/
```

The miniatures are typically generated with ChatGPT, asking for a square image.
Then I apply an overlay with the logo and colors to have a common style between programs.

## Step 7. Youtube video

Create a miniature for youtube using this Google Slides template:

<https://docs.google.com/presentation/d/1vtZ28nXhAE0UOhX389GVYb2JZdlFav0FtU0BLGOgFow/edit#slide=id.g2b3387a4107_0_63>

Export the image to `.svg` and using GIMP render it to 1920x1080, also render it to 960x540 for the website.

Create a video combining the audio and the miniature with this website: <https://www.onlineconverter.com/audio-to-video>

## Step 8. Create new page on the website

There is a template that allows to create a new page with the links to the program.
That way we can easily share the episode to the people and they choose which platform to use.
Paste the image from `.svg` directly to avoid having a too big image.

## Step 9. Publish the episode on Ivoox and Youtube

## Step 10. Announce the launch on Twitter and other platforms

Create a landing page on the website to share the episode.

## Step 11. Collect stats about the podcast

<https://docs.google.com/spreadsheets/d/1rT_tqf2MN8p5VNHsaxPrNQTT-IkxjzchQKbhbH84Esw/edit#gid=0>
