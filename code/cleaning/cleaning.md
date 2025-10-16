# Cleaning

We had a problem with noise in the recording on 25/09/2025. We solved it with these steps.

## Remove noise

On a first step we removed the noise using [Enhance Speech by Adobe](https://podcast.adobe.com/en/enhance#). It's a paid
tool but the first month is free, so we didn't have to pay for it.

## Change voice

The quality was much better after removing the noise, but the voices were still weird sometimes. Thus we
decided to change all the voices using [Elevenlabs](https://elevenlabs.io/docs/cookbooks/voice-changer).

We used the voice from `David Martin 1`, voice id: `Nh2zY9kknu6z4pZy6FhD`.

### Split into audios of less than 5 minutes

Elevenlabs only supports audio of less than 5 minutes, so we had to first split the audio into multiple
parts. This was done using the following script that chooses a good point for splitting the audios (with silence).

```bash
python crop_audio.py /mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part2_v1_cleaned.mp3 /mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part2_segments
```

### Convert voice


The script requires to create a `.env` file with `ELEVENLABS_API_KEY=<your_api_key_here>`

```bash
python voice_changer_batch.py \
/mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part1_segments \
/mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part1_segments_voice_changed
```

### Combine the audios again

Then combine all the audio splits into a single audio:

```
ffmpeg -f concat -safe 0 -i <(for f in *.mp3; do echo "file '$PWD/$f'"; done) -c copy output.mp3
```