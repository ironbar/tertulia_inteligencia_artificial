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
- Anotar en un papel los instantes de tiempo que necesitan edición

Cosas que hacíamos al principio pero ya no hacemos:

- Una práctica que facilita mucho la edición es silenciarse cuando no estamos hablando. Esto lo hacíamos al
inicio de los podcasts, luego dejamos de hacerlo para intentar que sean más naturales las conversaciones.
A día de hoy no tengo claro si es mejor silenciarse o no.
- Grabar un poco de silencio para eliminar ruido de fondo. Esto se ha visto no necesario porque los micrófonos
son suficienemente buenos y el ruido de fondo es muy bajo.

## Edición

[Guía de edición](edicion.md)

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
