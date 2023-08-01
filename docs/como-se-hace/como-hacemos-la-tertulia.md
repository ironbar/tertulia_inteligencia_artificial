# Como hacemos la TERTULia

## Grabación

### Preparar la sala

- Estamos grabando en la sala Endor de das-Nano que creemos que es la de mejor acústica del edificio
- Cerrar las cortinas para minimizar los rebotes de sonido en los cristales
- Cubrir la tele con un abrigo también para minimizar los rebotes
- Traer percheros con abrigos y ponerlos en las esquinas para minimizar eco, poner sillas en las esquinas
- Servir líquidos a los tertulianos
- Silenciar los moviles
- No usar sillas con ruedas

### Equipo de grabación

- Cada tertuliano necesita un portátil silencioso
- Estamos usando el micrófono [Razer Seiren Mini](https://www.mediamarkt.es/es/product/_micr%C3%B3fono-razer-seiren-mini-mercury-usb-para-pc-mac-ps4-110-db-blanco-1495613.html) y este [brazo](https://amzn.eu/d/3hzRJB3) para grabar.

### Software de grabación

#### Arecord

Los últimos programas los hemos grabado con arecord. Utilizando un hub usb hemos conectado todos los
micrófonos al mismo portátil, y luego la grabación se hace así:

```bash
arecord -l
arecord -D plughw:2,0 -r 48000 -f S16_LE alsa2.wav
arecord -D plughw:3,0 -r 48000 -f S16_LE alsa3.wav
arecord -D plughw:4,0 -r 48000 -f S16_LE alsa4.wav
arecord -D plughw:5,0 -r 48000 -f S16_LE alsa5.wav
```

#### Zencastr

Al principio usabamos [zencastr](https://zencastr.com/) para grabar el podcast.

### Grabación del programa

- Asegurarse de que el volumen de los micrófonos es el adecuado. Aquí creo que habría que centrarse en que
el volumen es adecuado y no satura. Luego en la edición es muy fácil equilibrar los micrófonos si hay diferencias.
Para poder ver esto lo mejor es abrir audacity, grabar un poco de audio y ver el nivel de energía. Luego se corrige con los ajustes de sistema de Sonido
- Hay que dar 3 golpes con la claqueta al inicio y al final del programa. Cuando hagamos esto los micrófonos tienen que estar orientados hacia la claqueta, que estará en el centro de la mesa.
- Si hay errores en la grabación señalizarlos con la claqueta para editarlos más fácilmente, una claqueta cuando se detecte el error y otra cuando se vaya a corregir.
- Cuando termina el programa verificar que todos los audios se han grabado bien en zencastr.
- Levantar la mano durante el programa para tener un turno ordenado de palabra
- Hablar muy bajo y con la mano tapando el micrófono si queremos decir algo que no queremos que se grabe

Cosas que hacíamos al principio pero ya no hacemos:

- Una práctica que facilita mucho la edición es silenciarse cuando no estamos hablando. Esto lo hacíamos al
inicio de los podcasts, luego dejamos de hacerlo para intentar que sean más naturales las conversaciones.
A día de hoy no tengo claro si es mejor silenciarse o no.
- Grabar un poco de silencio para eliminar ruido de fondo. Esto se ha visto no necesario porque los micrófonos
son suficienemente buenos y el ruido de fondo es muy bajo.

## Edición

La edición puede dividirse en los siguientes pasos:

1. Corregir el desalineamiento y la desincronización
1. Editar las secciones del programa
1. Componer el programa juntando todas las secciones
1. Descripción del programa
1. Miniatura del programa
1. Publicación del programa

### Corregir el desalineamiento y la desincronización

El mayor problema que hemos encontrado al grabar el podcast es que los audios se desincronizan a lo largo
del tiempo. Aunque alineemos los audios al inicio utilizando una claqueta luego se van desincronizando
progresivamente.

Esta desincronización hace que aparezca eco. La forma que hemos encontrado de solucionarlo es utilizar
la claqueta tanto al inicio como al final del programa. Como el desalineamiento es progresivo este
se puede corregir eliminando samples de audio. Utilizando las claquetas medimos y corregimos el desalineamiento con el siguiente script.

```python
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

shorten_audio('gbarbadillo.wav', offset_ms=7, duration_s=int(30*60 + 45))
shorten_audio('vgoni.wav', offset_ms=9, duration_s=int(30*60 + 45))
```

Esto no elimina completamente el eco, ya que el alineamiento es perfecto respecto al centro de la habitación.
El problema es que el sonido tarda unos 3 ms en recorrer 1 metro de distancia.

### Curate the audio

#### 1. Remove echo caused by other people speaking

On a first step listen to the podcast to see if this step is necessary.

If the speaker is a good one you can simply use `Noise Gate`, choose a good threshold and silence the parts where the speaker does not talk. Be conservative with the threshold to avoid removing voice. For this is very important to talk to the microphone.

In the other hand we can use `Auto Duck` tool that reduces the volume based on the track below. We can mix tracks and use them to remove the noise from the other tracks.

At the same time we can use `Normalize` or `Amplify` to have the same energy in all the audios.

When nothing works manually silencing the parts with `CTRL+L` is an option.

Finally listen to different parts of the audio to verify that the quality is good.

#### 2. Remove silences

Remove the parts of the audio when none is talking. One easy way to visualize this is to mix the tracks and look at the mixed result.

Truncate silence is also a great tool for this. -25, 1, 1

#### 3. Compressor

This will help to have a more uniform volume throughtout the podcast. -20,-60,3:1

### Compose the program

#### Music

- Adjustable fade 0-100%
- Amplify -30 dB for the background music
- Verify that the volume is uniform throught the program

### Review

Open the final file with audacity and verify that:

- The sound is good
- There are no silences
- Volume is uniform

### Editar las secciones del programa

1. Open an audio with Audacity
1. Import all the other audio tracks
1. Align the audios with the claps. Escuchar que se haya alineado bien.
1. Borrar silencio y palmada inicial
1. Borrar y corregir errores (para ello es util apuntar los minutos con problemas, o mejor aún dar palmadas)
1. Splits the track into multiple chunks if missalingment is found at the middle or end of the audio
1. Normalize volume. Cuidado si hay una persona que no habla, porque amplificará mucho el ruido.
1. Truncate silence, -30 dB, 1s, 1s
1. _Optional_ Compressor -20, -60, 3 [Make your audio sound GREAT with the Audacity Compressor](https://www.youtube.com/watch?v=eRunJa8fHvs). This can help to have the same volume over all the audio.
1. Export to mp3
1. Run [whisper](https://colab.research.google.com/drive/1nq8bg4y6V8FY3IJ3qIYg1Kw785oq_9TJ#scrollTo=Cub5GGnyXgEi) on a google colab to get transcription and detect possible errors

Al principio solía aplicar `Noise reduction` a cada pista por separado, pero la calidad inicial es buena y no aporta nada.

### Componer el programa juntando todas las secciones

Aquí se trata simplemente de juntar todas las secciones del programa y añadir música.

Para compaginar la música y la voz hemos usado estos filtros:

1. Adjustable Fade 100 -> 1%. Esto para hacer la transición música-voz o viceversa.
1. Amplify -30db. Esto para que se oiga la música de fondo bajita mientras hablamos.

En el primer programa hemos usado [esta canción](https://freemusicarchive.org/music/oriondrive/the-matrix/matrix-a/) que no tiene derechos de autor. En los siguientes hemos empezado a usar la canción de `Night Sentinels` (inspirados por Axel Casas) ya que en Ivoox se puede subir audio con derechos de autor. La música se pone al inicio y al final del programa, y un poquito entre transiciones de secciones.

### Algunos trucos de Audacity

- Stutter. Se hace con el efecto `Repeat` y tambien se le puede meter un poco de `Reverb`
- [Auto duck](https://manual.audacityteam.org/man/auto_duck.html), baja el volumen de una pista cuando en la otra pista estamos hablando. Importante fijar bien los umbrales.
- [Noise gate](https://manual.audacityteam.org/man/noise_gate.html), silencia todo lo que este por debajo de un umbral de energía
- Añadir ruido de [bocinas](https://www.youtube.com/watch?v=OQ-tBvsVot8)

### Descripción del programa

Este es un ejemplo de descripción del programa.

```text

Hoy vamos a hablar de la trayectoria de OpenAI. Si quieres saber cómo OpenAI pasó de ser una ONG a una empresa valorada en 30 mil millones de dolares, controlada por Microsoft quédate con nosotros. Debatiremos cómo OpenAI se ha ido volviendo más secretista y cerrada con el tiempo, del valor del código abierto frente al valor de la accesibilidad y muchos temas más.

Participan en la tertulia: Íñigo Olcoz, Victor Goñi y Guillermo Barbadillo.

Recuerda que puedes enviarnos dudas, comentarios y sugerencias en: https://twitter.com/TERTUL_ia

Más info en: https://ironbar.github.io/tertulia_inteligencia_artificial/

Este episodio ha sido patrocinado por Veridas: https://veridas.com/
```

### Miniatura

Lo más sencillo para generar una miniatura es utilizar [Bing](bing.com/chat) que es la que mejor
resultados me está dando. Otras opciones son [Dalle2](https://labs.openai.com/), midjourney, clipdrop ...
Utilizar como texto de entrada el título del programa o algun tema que haya salido en el programa.

He creado un overlay con el icono y los colores del programa.

### Publicación del programa

El programa se sube a Ivoox, y automáticamente se publica en Spotify y Apple Podcasts. También hay que subirlo
a Youtube.

Para poder publicar en youtube hace falta convertirlo a mp4, para ello usamos esta [web](https://www.onlineconverter.com/audio-to-video)

También estoy haciendo una copia de seguridad en [Google Drive](https://drive.google.com/drive/u/1/folders/1dr8fYZERMS9wd2dRdMhkLSYyPHLI_lrv) por si acaso.
## Links

- [Ivoox solo envia los 20 ultimos podcasts a Spotify con el plan gratuito](http://www.todosobrepodcast.com/2020/08/por-que-solo-llegan-20-episodios-de-tu.html)
- [Jaime Altozano sobre como sonar bien](https://www.youtube.com/watch?v=4Wp8X7MvGB0) Comenta que la calidad de la tarjeta de sonido de un ordenador no tiene comparación con una tarjeta externa. Recomienda este [micrófono](https://www.amazon.es/profesional-transmisi%C3%B3n-condensador-antivibratoria-alimentaci%C3%B3n/dp/B00XBQ8UGG) y esta [tarjeta de sonido](https://www.amazon.es/Behringer-UM2-Interface-audio-sampleado/dp/B00EK1OTZC). Comenta también el tema de los micrófonos USB y dice que pueden estar bien para un podcast pero no para grabar música.
- [Como grabar y editar un podcast](https://www.youtube.com/watch?v=DyKd-1X9mK0) Está bien pero está más orientado a una sola persona.

## Roles

Sería necesario que los roles puedan ser realizados por varias personas porque no siempre estará todo el mundo disponible o no siempre habrá la misma gente.

### Técnico de sonido

- Grabar el podcast con calidad, asegurar que todo funciona bien antes de empezar y que no hay ruidos de fondo.

### Presentador

- Presentar el programa, dar la bienvenida, introducir el tema, dirigir la conversación, etc.

### Edición

- Editar el podcast para que suene bien, eliminar los silencios, añadir música de fondo, etc.

## Otras experiencias

El 26/01/2023 grabamos un podcast interno de la empresa Veridas con Iker Gómez que antes había hecho
el pocast Bigdateame. Usamos el micrófono [Talk Go](https://www.amazon.es/JLab-Audio-Talk-Black-W125781587/dp/B0885C9FLV).
Al día siguiente me lo he traído a casa para hacer pruebas y diría que se escucha bastante bien si
se usa correctamente (la posición natural no es la que hay que utilizar [Manual](https://cdn.shopify.com/s/files/1/0240/9337/files/Talk_GO_Microphone_Manual.pdf?v=1621028683))
Este micrófono cuesta 40 euros por lo que puede ser una opción económica para empezar el podcast.

Para grabar el podcast estabamos 3 personas y cada uno tenía su micrófono y su ordenador. Hay que tener
cuidado que los ordenadores sean silenciosos porque el de Íñigo se puso a ventilar y habrá que ver
como quedó el podcast. Para grabar todos los audios a la vez y tenerlos sincronizados usamos la web
de [zencastr](https://zencastr.com/)

## Consejos de Chelus

Aspectos a tener en cuenta para elegir una sala de grabación:

- El cristal es malo, refleja mucho el sonido, hay que cubrirlo con cortinas
- Los azulejos también reflejan mucho, por lo que el baño o la cocina son malos sitios
- Evitar superficies paralelas

Aspectos a tener en cuenta en la edición:

- Eliminar el ruido. Para esto se puede grabar 20s de silencio al principio de la sesión que sirvan para calcular el perfil de ruido. (Noise Reduction en Audacity)
- Noise Gate. Todo el audio que está por debajo de cierta potencia lo silencia automáticamente.
- Mutear a los que no hablan.

Sobre el micrófono supercardioide es mejor que cardioide. Me he comprado el [Razer Seiren Mini](https://www.mediamarkt.es/es/product/_micr%C3%B3fono-razer-seiren-mini-mercury-usb-para-pc-mac-ps4-110-db-blanco-1495613.html) por 40 euros para hacer pruebas.
