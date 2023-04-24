# Como hacemos la TERTULia

## Grabación

### Preparar la sala

- Estamos grabando en la sala Endor de das-Nano que creemos que es la de mejor acústica del edificio
- Cerrar las cortinas para minimizar los rebotes de sonido en los cristales
- Cubrir la tele con un abrigo también para minimizar los rebotes
- Traer percheros con abrigos y ponerlos en las esquinas para minimizar eco
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

1. Align the audios with the claps
1. Borrar silencio y palmada inicial
1. Borrar y corregir errores (para ello es util apuntar los minutos con problemas, o mejor aún dar palmadas)
1. Splits the track into multiple chunks if missalingment is found at the middle or end of the audio
1. Normalize volume
1. Truncate silence, -30, 1, 1
1. Export to mp3
1. Run [whisper](https://colab.research.google.com/drive/1nq8bg4y6V8FY3IJ3qIYg1Kw785oq_9TJ#scrollTo=Cub5GGnyXgEi) on a google colab to get transcription and detect possible errors

### Voz

1. Importamos todos los audios a [Audacity](https://www.audacityteam.org/), cada audio va a ser una pista diferente.
1. `Normalize` todos los audios para que tengan un volumen parecido. Se puede ir reaplicando la normalización conforme vamos limpiando los audios.
1. `Noise reduction` a cada pista por separado. Se calcula un perfil de ruido en base al silencio del inicio del podcast y luego se limpia todo el audio.
1. Alinear las pistas. Una pista se usa como referencia y las otras se alinean usando como referencia
las palmadas. Esto no es perfecto porque he observado que el desalineamiento evoluciona a lo largo del audio.
Quizá tendría sentido entonces partir los audios en trozos y alinear por secciones. El desalineamiento
provoca que se oiga eco si hay dos micrófonos activos al mismo tiempo.
1. Para agilizar la revisión fijarse únicamente cuando cambia la persona que habla. Aplicar silencio
a la persona que no está hablando. **TODO** es posible que esto pueda hacerse automáticamente con algún plugin.
1. Eliminar silencios innecesarios.
1. Eliminar meteduras de pata, si hemos dado palmadas cuando ha sucedido será más fácil de editar.

**TODO** Herramientas a mirar para el próximo podcast:

- [Auto duck](https://manual.audacityteam.org/man/auto_duck.html), baja el volumen de una pista cuando en la otra pista estamos hablando. Importante fijar bien los umbrales.
- [Noise gate](https://manual.audacityteam.org/man/noise_gate.html), silencia todo lo que este por debajo de un umbral de energía

### Música

Para que el programa quede más profesional es buena idea meterle una música de fondo. Sólo se puede
usar música sin derechos de autor. En [Free Music Archive](https://freemusicarchive.org) hay un catálogo
bastante grande. P.e. en el primer programa hemos usado [esta canción](https://freemusicarchive.org/music/oriondrive/the-matrix/matrix-a/)

Para compaginar la música y la voz hemos usado estos filtros:

1. Adjustable Fade 100 -> 1%
1. Amplify -30db

### Miniatura

Lo más sencillo para generar una miniatura es utilizar [Dalle2](https://labs.openai.com/) o incluso mejor [bing](bing.com/chat).
Utilizar como texto de entrada el título del programa o algun tema que haya salido en el programa.

### Título y Descripción

El título ya lo tendremos preparado en el guión, la descripción será breve y comentará quienes
son los participantes, link a la web y créditos a la música.

Ejemplo del primer programa:

```text
El año pasado la irrupción de Dalle2 y Stable Diffusion pusieron patas arriba el mundo del arte. En el programa de hoy analizamos el impacto que herramientas como ChatGPT o Copilot pueden llegar a tener en el mundo de la programación.

Participan en la tertulia Íñigo Olcoz, Víctor Goñi, Paco Zamora y Guillermo Barbadillo. Iker Gómez nos ayuda con la parte técnica.

Créditos:
<https://ironbar.github.io/tertulia_inteligencia_artificial/guiones/01-copilot-fin-programacion/>
<https://freemusicarchive.org/music/oriondrive/the-matrix/matrix-a/>
```

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

