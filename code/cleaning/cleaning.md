# Cleaning

We had a problem with noise in the recording on 25/09/2025. We solved it with these steps.

## Remove noise

## Change voice

The quality was much better after removing the noise, but the voices were still weird sometimes. Thus we
decided to change all the voices using Elevenlabs.

David Martin 1. voice id: `Nh2zY9kknu6z4pZy6FhD`


https://elevenlabs.io/docs/cookbooks/voice-changer

The script requires to create a `.env` file with `ELEVENLABS_API_KEY=<your_api_key_here>`

```bash
python voice_changer_batch.py \
/mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part1_segments \
/mnt/data/other/data/TERTULia/episodios_tertulia/temporada_4/grabacion_01/curated_audios/part1_segments_voice_changed
```
