# Como hacemos la TERTULia

## Grabación

### Preparar la sala

- Estamos grabando en la sala Endor de das-Nano que creemos que es la de mejor acústica del edificio
- Cerrar las cortinas para minimizar los rebotes de sonido en los cristales
- Cubrir la tele con un abrigo también para minimizar los rebotes
- Traer percheros con abrigos y ponerlos en las esquinas para minimizar eco, poner sillas en las esquinas
- Servir líquidos a los tertulianos
- Silenciar los moviles

### Equipo de grabación

- Cada tertuliano necesita un portátil silencioso
- Estamos usando el micrófono [Razer Seiren Mini](https://www.mediamarkt.es/es/product/_micr%C3%B3fono-razer-seiren-mini-mercury-usb-para-pc-mac-ps4-110-db-blanco-1495613.html) y este [brazo](https://amzn.eu/d/3hzRJB3) para grabar.
- Usamos [zencastr](https://zencastr.com/) para grabar el podcast. Permite centralizar la grabación del podcast pero tiene el gran problema de que los audios no están bien sincronizados y además la sincronía se pierde a los 10-15 minutos por lo que hay que alinearlos con palmadas.

### Grabación del programa

- Asegurarse de que el volumen de los micrófonos es el adecuado. Aquí creo que habría que centrarse en que
el volumen es adecuado y no satura. Luego en la edición es muy fácil equilibrar los micrófonos si hay diferencias.
Para poder ver esto lo mejor es abrir audacity, grabar un poco de audio y ver el nivel de energía.
- Es buena práctica dividir el programa en secciones más pequeñas ya que eso facilita la edición.
- Al inicio de cada sección dar 3 palmadas en el centro de la mesa para poder alinear los audios.
- También sería útil dar palmadas cada 10 min para corregir la perdida de sincronía
- Si hay errores en la grabación señalizarlos con palmadas para que sea más fácil localizarlos en la edición
- Cuando termina el programa verificar que todos los audios se han grabado bien en zencastr.
- Durante el programa el técnico de sonido verifica que todo va bien y que nos estamos acordando de desilenciarnos y silenciarnos.
- Levantar la mano durante el programa para tener un turno ordenado de palabra

Cosas que hacíamos al principio pero ya no hacemos:

- Una práctica que facilita mucho la edición es silenciarse cuando no estamos hablando. De lo contrario
se oye eco porque los audios no están perfectamente alineados y además el desalineamiento cambia con el tiempo.
Ahora hacemos un mejor alineamiento de los audios y los dejamos abiertos para captar risas o favorecer el dinamismo del programa.
- Grabar un poco de silencio para eliminar ruido de fondo. Esto se ha visto no necesario porque los micrófonos
son suficienemente buenos y el ruido de fondo es muy bajo.

## Edición

La edición puede dividirse en los siguientes pasos:

1. Editar las secciones del programa
2. Componer el programa juntando todas las secciones
3. Descripción del programa
4. Miniatura del programa
5. Publicación del programa

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

Este es un ejemplo de la descripción del 3º programa. Consta de:

- Breve descripción del programa
- Autores
- Indice de las secciones
- Links a la web del programa y a los guiones

Debería estar incluida en el guión del programa

```text
En los últimos años hemos visto como han ido creciendo los modelos de lenguaje: GPT2, GPT3 y ahora GPT4. Cuando los modelos de lenguaje crecen en tamaño desarrollan nuevas habilidades de manera espontánea y no predecible, por ejemplo la capacidad de hacer calculos matemáticos. Hoy vamos a hablar sobre este fenomeno de emergencia de habilidades al aumentar la escala y discutiremos si esta senda de entrenar modelos más grandes en cada vez más datos es suficiente para llegar a la Inteligencia Artificial General.

Participan en la tertulia Íñigo Olcoz, Paco Zamora, Josu Gorostegui y Guillermo Barbadillo.

02:46 Preguntas oyentes
17:27 Emergencia y Escala
34:54 Emergencia y Escala en IA
01:12:13 Futuro de la IA
01:44:48 Recomendaciones y despedia

https://ironbar.github.io/tertulia_inteligencia_artificial/
https://ironbar.github.io/tertulia_inteligencia_artificial/guiones/03-emergencia/
```

### Miniatura

Lo más sencillo para generar una miniatura es utilizar [Dalle2](https://labs.openai.com/) o incluso mejor [bing](bing.com/chat).
Utilizar como texto de entrada el título del programa o algun tema que haya salido en el programa.

### Publicación del programa

Para poder publicar en youtube hace falta convertirlo a mp4, para ello usamos esta [web](https://www.onlineconverter.com/audio-to-video)

El programa se sube a Ivoox, y automáticamente se publica en Spotify y Apple Podcasts. También hay que subirlo
a Youtube.

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
