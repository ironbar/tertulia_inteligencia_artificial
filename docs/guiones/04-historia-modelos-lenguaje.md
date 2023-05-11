# Breve historia de los modelos de lenguaje

_17/05/2023_

## Descripcion

```text
Lorem fistrum papaar papaar apetecan diodenoo llevame al sircoo fistro. Quietooor amatomaa al ataquerl benemeritaar ese que llega fistro no puedor apetecan. Condemor al ataquerl condemor mamaar. Ese pedazo de caballo blanco caballo negroorl mamaar qué dise usteer pupita pupita jarl de la pradera. Al ataquerl ese que llega me cago en tus muelas ese pedazo de por la gloria de mi madre ese que llega llevame al sircoo

Participan en la tertulia: _completar_

02:46 Seccion 1 a renombrar
01:12:13 Seccion 2 a renombrar

https://ironbar.github.io/tertulia_inteligencia_artificial/
https://ironbar.github.io/tertulia_inteligencia_artificial/guiones/_completar_

Este episodio ha sido patrocinado por Veridas: https://veridas.com/
```

## Introducción

Bienvenidos a la tertulia de la inteligencia artificial. En el capítulo de hoy vamos a dar
un paso atrás en la historia, lo que nos permitirá conocer mejor una de las temáticas más
relevantes en la inteligencia artificial moderna: los modelos de lenguaje. En los anteriores
tres capítulos hemos hablado mucho de modelos como la familia GPT, principalmente GPT3,
GPT4, ChatGPT, y pensamos que es un buen momento para hacer un repaso histórico para
comprender el papel del modelado del lenguaje en la IA, y cómo de ahí hemos llegado a unos
modelos de un propósito tan general cómo los GPT.

Y sin más dilación, damos paso a presentar nuestros tertulianos de hoy...

<PRESENTACIONES>

## Preguntas de los oyentes

Relativo al documento filtrado de Google en el que señala que el mayor enemigo no es OpenAI sino la IA open-source.
https://twitter.com/raquelbars/status/1654769778303664131?s=20
  

## Tema en profundidad

### ¿Qué es el lenguaje?
  
Definición de wikipedia: https://es.wikipedia.org/wiki/Lenguaje
  
> El lenguaje es un sistema de comunicación estructurado para el que existe un contexto de
> uso y ciertos principios combinatorios formales.
  
De la RAE: https://dle.rae.es/lenguaje
  
> Facultad del ser humano de expresarse y comunicarse con los demás a través del sonido
> articulado o de otros sistemas de signos.
>
> Código de signos. Lenguaje formal.
>
> Conjunto de signos y reglas que permite la comunicación con una computadora.

**TERTULIANOS, A DEBATIR**

El lenguaje tiene el propósito de permitir la comunicación, la transmisión de realidades
entre diferentes personas. Te cuento lo que estoy pensando para conseguir proyectar en
tu mente mi mismo pensamiento. Sin embargo, para lograr este cometido debemos usar
algo más amplio, la comunicación. La forma más efectiva de comunicar es una mezcla
de herramientas y facultades: el uso de los gestos, de herramientas estéticas del
lenguaje (cómo la hipérbole), apoyar la comunicación con relatos, o el uso
de herramientas más impactantes como las audiovisuales. Todo ello permite comunicar
mejor nuestro mensaje. No obstante, el lenguaje está en la base de toda la comunicación
y es nuestra forma de expresión más básica, aunque no por ello la más simple.
  
Temas interesantes a comentar:
  
1. Lenguaje y comunicación.
2. Límites del lenguaje. ¿Puede transmitirse una realidad física sólo mediante palabras?
3. El sentido común y el lenguaje, ¿Cabe todo nuestro conocimiento de base en textos?
   - Comentario sobre el "sentido común" según Lecun: <https://spectrum.ieee.org/ai-hallucination>

### ¿Qué es un modelo de lenguaje?

<details><summary>Introducción formal</summary>

Un modelo de lenguaje es una herramienta utilizada para discrimar frases o texto que
pertence a un determinado lenguaje de aquél texto que no pertenece a dicho lenguaje.
Estos modelos se pueden distinguir por la técnica empleada para el modelado, y el
tipo de modelado que se hace. Así, podemos encontrar diferentes técnicas con las
que históricamente se han ido construyendo los modelos:

- Modelos basados en reglas. De esta categoría fueron los primeros sistemas
  de lenguaje natural, y por ende, los primeros modelos de lenguaje que
  fueron desarrollados, allá por la decada de los 50s.
- Las gramáticas formales. Princpialmente gramáticas regulares y gramáticas
  incontextuales, pues añadir más complejidad complica la capacidad de
  aprendizaje y el cómputo requerido para el análisis.
- Los autómatas finitos. Equivalentes a las gramáticas formales, los autómatas
  fueron pieza clave para representar las gramáticas de una forma compacta,
  e incluso se desarrollaron algoritmos de aprendizaje de autómatas a partir
  de datos. En esta categoría caen los modelos de "ngramas".
- Las redes neuronales artificiales. De muy diferentes tipos, en la historia
  han ido evolucionando hasta llegar a los modelos que tenemos hoy.

Y por otro lado, al respecto de los diferentes tipos de modelado, tenemos:

- Modelado binario: No se si tiene un nombre mejor, pero este es el que
  parece más adecuado. Son binarios todos los modelos de lenguaje que
  se usan para decir si una frase pertenece o no a una gramática. Es
  decir, que resuelven un problema de decisión al respecto de la
  pertenencia a la gramática del lenguaje que se está tratando.
    - Este tipo es muy útil en la ingeniería y permite el desarrollo de
      sistemas muy simples con gramáticas que permiten asegurar la bondad
      de la respuesta. Por ejemplo, en un reconocedor de matrículas de
      coches, una arquitectura sencilla que permite resolver el problema
      se compone de cuatro componentes básicos: el extractor de matrículas,
      que las busca en la imagen y permite extraer de cada matrícula los
      caracteres que hay que leer; el reconocedor de caracteres que por
      cada imagen de cada carácter calcula un vector con la probabilidad
      posterior de cada carácter a reconocer; el modelo de lenguaje
      que nos dice que secuencias de caracteres son válidas; y el algoritmo
      de búsqueda que decodifica la secuencia de caracteres válida que
      es más verosimil.
- Modelado estadístico. En lugar de indicarnos si la frase es válida o no,
  nos da una puntuación, normalmente una probabilidad, de tal forma que
  la probabilidad es mayor para aquellas secuencias de palabras que
  pertenecen al lenguaje, y menor para las que no, pero todas las secuencias
  son posibles en estos modelos. Este comportamiento dota a estos modelos de
  una gran flexibilidad, lo que permite resolver muchos problemas de lenguaje
  natural de una forma más efectiva. Por ejemplo, en lenguaje hablado las
  personas cometen errores gramaticales, y con los modelos estadísticos
  se puede decodificar de forma satisfactoria, incluyendo esos errores, mientras
  que con modelos binarios hace falta una mayor ingeniería para que el modelo
  permita aceptar errores en la gramática.

</details>

TODO: reformular la introducción técnica para hacerla más amena.

### De la traducción automática... a la explosión del reconocimiento de voz

El interés por el lenguaje, dentro del campo de la IA, ha sido siempre muy elevado.
Por ser la forma de comunicación más básica que tenemos los humanos, también
es la herramienta de comunicación más conveniente con las máquinas. Pero esto
llega con multitud de problemas diferentes debido a las ambigüedades del lenguaje
natural. Pero no nos adelantemos.
  
En el inicio, el lenguaje empezó a tratarse automáticamente para la creación de
traductores basados en reglas (ver
[Experimento Georgetow](https://en.wikipedia.org/wiki/Georgetown%E2%80%93IBM_experiment)).
Estamos en los años 50, IBM que experimentó con un traductor de un dominio
mega-restringido, que con tan sólo 6 reglas gramaticales y 250 términos léxicos,
permitía traducir oraciones del ruso al inglés. Pasaron diez años de grandes
inversiones de dinero público, y luego un pequeño episodio de invierno llegó
al no alcanzar los resultados esperados a la velocidad esperada (véase
[Invierno de la IA](https://en.wikipedia.org/wiki/AI_winter)).

  
TODO: poner aquí un breve relato sobre como llegamos a los modelos estadísticos.

TODO: indicar que nuestro interés va a estar en los modelos estadísticos por ser
los que han sido más efectivos en la historia, pero que contamos algo sobre el
resto por ponerlos en una cronología.

### Contexto es todo lo que necesitas

### Se nos olvidaron los espacios de variedades: modelos de lenguaje basados en redes neuronales

### Atención y contexto: los transformers y compañía
  
#### Sesgos inductivos de las diferentes arquitecturas
  
Son hipótesis sobre la estructura de los datos y el problema a resolver que ayudan a aprender más rápido. Los sesgos inductivos limitan el espacio de búsqueda. Pueden llegar a ser limitantes. La tendencia actual es reemplazar en lo posible los sesgos inductivos por un dataset más grande. Va a aprender más despacio pero sin limitaciones.
  
https://towardsdatascience.com/the-inductive-bias-of-ml-models-and-why-you-should-care-about-it-979fe02a1a56#:~:text=Transformers%20have%20no%20strong%20inductive,if%20enough%20data%20is%20provided.
  
No free lunch theorem

En general todas las redes neuronales tienen el sesgo inductivo de descomponer el problema en multiples pasos: las capas de la red.
  
##### Redes Convolucionales

- Estructura 2d de los datos (imagen)
- Conectividad local. La información se procesa a nivel local, cada región de la imagen por separado. Solo se analizan los pixeles cercanos.
- Invarianza a la traslación. Los filtros se repiten por toda la imagen, se asume que un filtro que es útil en la esquina superior izquierda también lo será en la esquina inferior derecha
- Organización en canales. Asume la información puede representarse en diferentes canales.

##### RNN
  
- Secuencias ordenadas, pueden ser de tamaño variable
- Procesar los elementos uno a uno en orden
- Invarianza temporal. Los pesos se repiten a lo largo del tiempo. Es lo mismo que las CNN pero aplicado a la dimensión temporal en vez de espacial.
- Memoria. Conforme procesa la secuencia va almacenando la información en una memoria. Esto no es trivial y dificulta el aprendizaje
 
##### MLP

- Universal function approximation
- Continuidad de la salida. Asume que la salida no tiene cambios abruptos.
- Representación distribuida. Asume que la información se puede representar distribuidamente en en un grupo de neuronas

##### Transformers
  
Es la arquitectura que menos sesgos inductivos tiene, por lo que es más flexible pero necesita muchos datos. No es adecuada para datasets pequeños.

- Conjunto de datos no ordenado. (El orden se inyecta modificando los datos de entrada)
- Atención. Compara los distintos elementos del conjunto entre sí.
- Se adapta a cada caso, el MLP siempre hace el mismo procesamiento. 
- Conectividad global. Compara todos los elementos entre sí, no solo los más cercanos. Esto hace innecesario el mecanismo de memoria de las RNN, facilitando el aprendizaje. Por otra parte al crecer cuadraticamente con el tamaño de la entrada dificulta el trabajar con secuencias muy largas (aunque se están inventando trucos y nuevos mecanismos para resolver esto).
  
## Recomendaciones

## Despedida
