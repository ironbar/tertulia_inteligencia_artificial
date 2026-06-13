# KV Cache: el reto de guardar conversaciones de 100GB

- [<img src="../../../res/spotify-icon-256.webp" alt="spotify_logo" width="32" style="position: relative; top: 5px;"> Spotify](https://open.spotify.com/episode/29k3LPAUS1r6IFOewkMsnN?si=GwPMvfS5Tlac7vAzGkyYfA)
- [<img src="../../../res/youtube-icon-256.png" alt="youtube_logo" width="32" style="position: relative; top: 10px;"> Youtube](https://youtu.be/hETmnJZGZ9I)
- [<img src="../../../res/ivoox-icon-256.webp" alt="ivoox_logo" width="32" style="position: relative; top: 5px;"> Ivoox](https://go.ivoox.com/rf/175487402)
- [<img src="../../../res/apple-icon-256.webp" alt="apple_logo" width="32" style="position: relative; top: 5px;"> Apple Podcasts](https://podcasts.apple.com/us/podcast/kv-cache-el-reto-de-guardar-conversaciones-de-100gb/id1669083682?i=1000772490661)

![alt text](images/1781339240700_image.png)

La KV Cache se ha convertido en uno de los grandes retos para escalar los LLMs: guardar el contexto de una conversación no significa almacenar texto, sino enormes tensores por cada token y capa del modelo. A partir de ahí aparece el verdadero problema: una conversación larga puede ocupar decenas o cientos de GB, saturar la VRAM de las GPUs y obligar a diseñar sistemas capaces de paginar, compartir, mover y reutilizar esa caché entre GPU, RAM, SSD y red. La idea central: los LLMs modernos no escalan solo con más cálculo, sino gestionando una memoria gigantesca de la forma más inteligente posible.

Participan en la tertulia: Paco Zamora, Josu Gorostegui y Guillermo Barbadillo.

Recuerda que puedes enviarnos dudas, comentarios y sugerencias en: <https://twitter.com/TERTUL_ia>