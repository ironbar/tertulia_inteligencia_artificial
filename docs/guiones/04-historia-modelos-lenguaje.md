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

!!! abstract "Intro Paco"

    Bienvenidos a la tertulia de la inteligencia artificial. En el capítulo de hoy vamos a dar
    un paso atrás en la historia, lo que nos permitirá conocer mejor una de las temáticas más
    relevantes en la inteligencia artificial moderna: los modelos de lenguaje. En los anteriores
    tres capítulos hemos hablado mucho de modelos como la familia GPT, principalmente GPT3,
    GPT4, ChatGPT, y pensamos que es un buen momento para hacer un repaso histórico para
    comprender el papel del modelado del lenguaje en la IA, y cómo de ahí hemos llegado a unos
    modelos de un propósito tan general cómo los GPT.

!!! example "Intro customizada por GPT4"

    ¡Bienvenidos, fanáticos de la inteligencia artificial! Agarraos fuerte porque hoy nos vamos a montar en nuestra máquina del tiempo para un viaje de regreso a las raíces de los modelos de lenguaje.

    En los últimos tres episodios, hemos estado charlando sobre los pesos pesados de la IA: los modelos GPT. Estoy seguro que te pica la curiosidad por saber de dónde salieron. ¿Cómo hemos llegado a tener estas bestias de la IA?

    Hoy, vamos a desentrañar ese misterio. Vamos a bucear en la historia y descubrir cómo pasamos de simples herramientas para jugar con palabras a estos genios del lenguaje, versátiles y poderosos, que son los modelos GPT. Así que, ponte cómodo, coge tus palomitas, y prepárate para un viaje épico en el tiempo. ¡Vamos allá!

Y sin más dilación, damos paso a presentar nuestros tertulianos de hoy... (no te olvides de ti mismo!)

!!! info "Cuña publicitaria"

    Este podcast es posible gracias a Veridas, la empresa en la que trabajamos los tertulianos.

    Veridas es una empresa líder en soluciones de identidad digital y biometría, que opera en más de 25 países y cuenta con más de 250 clientes en sectores como la banca, los seguros, las telecomunicaciones o las administraciones públicas.

    Veridas está en pleno crecimiento y busca gente con talento y ganas de aprender para trabajar en proyectos de inteligencia artificial aplicada a la biometría facial, de voz y de documentos. Si te interesa el reto, visita nuestra página web Veridas.com y envíanos tu currículum. ¡Te esperamos!

## Preguntas de los oyentes

Relativo al documento filtrado de Google en el que señala que el mayor enemigo no es OpenAI sino la IA open-source.
https://twitter.com/raquelbars/status/1654769778303664131?s=20
  

## Tema en profundidad

### ¿Qué es el lenguaje?
  
Definición de [wikipedia](https://es.wikipedia.org/wiki/Lenguaje):
  
> El lenguaje es un sistema de comunicación estructurado para el que existe un contexto de
> uso y ciertos principios combinatorios formales.
  
De la [RAE](https://dle.rae.es/lenguaje):
  
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

Un modelo de lenguaje es una herramienta que sirve para establecer las reglas
gramáticales válidas en un dominio. El modelo puede ser "estricto" y estar
formado por reglas formales, y perteneciendo a alguno de los niveles
de la [jerarquía de Chomsky](https://es.wikipedia.org/wiki/Jerarqu%C3%ADa_de_Chomsky).
El modelo también puede ser "estocástico" y estar formado
por reglas difusas, siendo habituales los modelos estadísticos
que definen una distribución de probabilidad en secuencias de palabras.
Estos modelos se pueden distinguir por la técnica empleada para el modelado:

- Modelos basados en reglas. De esta categoría fueron los primeros sistemas
  de lenguaje natural, y por ende, los primeros modelos de lenguaje que
  fueron desarrollados, allá por la decada de los 50s.
- Las gramáticas formales. Principalmente gramáticas regulares y gramáticas
  incontextuales, pues añadir más complejidad complica la capacidad de
  aprendizaje y el cómputo requerido para el análisis.
- Los autómatas finitos. Equivalentes a las gramáticas formales, los autómatas
  fueron pieza clave para representar las gramáticas de una forma compacta,
  e incluso se desarrollaron algoritmos de aprendizaje de autómatas a partir
  de datos. En esta categoría caen los modelos de "ngramas".
- Las redes neuronales artificiales. De muy diferentes tipos, en la historia
  han ido evolucionando hasta llegar a los modelos que tenemos hoy.

Por otro lado, podemos tener diferentes tipos de modelado, como ya hemos mencionado:

- Modelado "estricto" o binario: No se si tiene un nombre mejor, pero este es el que
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

**Propuesta de ChatGPT** :)
  
Imagina que quieres enseñarle a un robot cómo hablar como tú. ¿Cómo lo harías? Podrías empezar estableciendo algunas reglas, como las que se enseñan en la escuela, por ejemplo, que un verbo siempre va acompañado de un sujeto. Pero en el lenguaje natural, no todo es tan sencillo como una regla. Por eso, existen los modelos de lenguaje.

Los modelos de lenguaje son como la guía del robot para hablar como un humano. Pueden ser estrictos, basados en reglas formales, o estocásticos, basados en reglas difusas y probabilidades. Los primeros son como una receta: si sigues las reglas, siempre obtendrás una respuesta correcta. Los segundos son como la intuición: no siempre acertarás, pero podrás entender la mayoría de las cosas que te dicen.

Los modelos estrictos se basan en reglas formales y matemáticas. Las gramáticas formales, los autómatas finitos y las redes neuronales son algunos ejemplos. Estos modelos son muy útiles para problemas que tienen respuestas binarias, como saber si una matrícula de coche es válida o no. Si un robot sigue las reglas, siempre sabrá si una matrícula es correcta o no.

Los modelos estocásticos, por otro lado, están basados en la probabilidad. Son como una máquina tragaperras: si tienes suerte, obtendrás la respuesta correcta. Los modelos estocásticos son útiles para problemas más complejos, como entender el lenguaje hablado de una persona. Como todos sabemos, las personas no hablamos de forma perfecta todo el tiempo, y los modelos estocásticos pueden entender y decodificar incluso los errores gramaticales.

En resumen, los modelos de lenguaje son como el manual de instrucciones para que un robot pueda hablar como tú. Pueden ser estrictos o estocásticos, basados en reglas formales o probabilidades, pero todos tienen un objetivo en común: hacer que la comunicación entre humanos y robots sea más efectiva y precisa.


### De la traducción automática... a la explosión del reconocimiento de voz

El interés por el lenguaje, dentro del campo de la IA, ha sido siempre muy elevado.
Es la forma de comunicación más básica entre personas, y por tanto, también
es nuestra herramienta de comunicación más conveniente con las máquinas. Pero esto
llega con multitud de problemas diferentes debido a las ambigüedades del lenguaje
natural.
  
En el inicio, el lenguaje empezó a tratarse automáticamente para la creación de
traductores basados en reglas (ver
[Experimento Georgetow](https://en.wikipedia.org/wiki/Georgetown%E2%80%93IBM_experiment)).
Estamos en los años 50, IBM que experimentó con un traductor de un dominio
mega-restringido, que con tan sólo 6 reglas gramaticales y 250 términos léxicos,
permitía traducir oraciones del ruso al inglés. Pasaron diez años de grandes
inversiones de dinero público, y luego un pequeño episodio de invierno llegó
al no alcanzar los resultados esperados a la velocidad esperada (véase
[Invierno de la IA](https://en.wikipedia.org/wiki/AI_winter)).

Durante los años 60, comenzó a surgir el interés en el reconocimiento de voz,
primero con modelos basados en dígitos, y luego palabra a palabra. En esta época
se inventó el algoritmo [DTW](https://en.wikipedia.org/wiki/Dynamic_time_warping)
que ha sido utilizado para alinear y estimar la similaridad entre pares de
secuencias con diferentes logintudes.
  
En los años 70 y principios de los 80 se desarrollaron los sistemas de reconocimiento
de voz basados en modelos ocultos de Markov. Estos tenían la ventaja de permitir
la combinación de diferentes fuentes de información: acústica, lenguaje, y sintáxis.
Todo en un mismo marco probabilista. En los 80 se introdujeron también los modelos
basados en ngramas, y durante los 80 y los 90 la inversión en sistemas de reconocimiento
de voz se incrementó bastante, y aparecieron algunos sistemas comerciales (Dragon Dictate),
aunque todavía quedaba mucho camino por recorrer.
  
Hemos mencionado a los ngramas, que a pesar de ser de los primeros modelos de lenguaje,
estuvieron presentes en los sistemas de reconocimiento de voz hasta los primeros años
del siglo XXI. Los ngramas son muy simples, y se estiman básicamente por conteo.
El modelo permite calcular la probabilidad de una palabra dada una ventana fija
de contexto previo (por ejemplo las dos palabras anteriores)

¿Nos suena este concepto?
  
TERTULIANOS COMENTAN SOBRE ESTA IDEA; PONGO ALGUNOS TEMAS

1. Comparar el contexto que recibe un modelo de ngramas contra un GPT.
2. Límites del método de estimación, en los ngramas, el conteo de veces
   que aparece una palabra detrás de una determinada secuencia de n-1
   palabras. Maldición de la dimensionalidad.
   - En dos secciones se comentará cómo podemos escapar de ese límite.
3. ¿Más temas? ...


??? warning "Limitaciones de los ngramas"

    1. **Sparsity**: N-grams require a large amount of data to accurately capture language patterns. But even with massive amounts of data, many possible n-grams won't occur in the training data, leading to sparsity. As the size of the n-gram (the "n") increases, the problem gets worse because the number of potential n-grams grows exponentially.
    2. **Lack of Long-Term Dependencies**: N-gram models have a fixed context length (the n-1 previous words). They can't account for dependencies outside this context window. This is a significant problem because language often contains long-range dependencies where the meaning of a word depends on words much earlier in the sentence.
    3. **Out of Vocabulary Problem**: If a word doesn't appear in the training data, the model has no way of dealing with it, because n-gram models fundamentally rely on counting occurrences of words or sequences of words. This is a big problem in practice because language is always evolving, and new words are constantly being created.
    4. **Lack of Semantic Understanding**: N-grams are purely statistical and don't understand the meaning of words. They only know that certain sequences of words tend to occur together. This leads to issues where n-grams can produce or fail to recognize semantically incorrect phrases if they are statistically likely.
    5. **Overfitting**: Because n-grams are based on the exact sequences of words in the training data, they can overfit to that data. This means they might perform poorly on new data that has different characteristics.
    6. **Storage**: Storing the count of every possible n-gram requires a lot of memory, particularly as n increases. This can make n-gram models impractical for large vocabularies or large values of n.


??? success "Ventajas de los ngramas"

    1. **Simplicity**: N-gram models are straightforward to understand and implement. They do not require complex algorithms or deep mathematical insights. You simply count the frequency of sequences of words in your data.
    2. **Efficiency**: Once the model has been trained (i.e., the n-gram frequencies have been counted), generating new text or calculating the probability of a piece of text is very fast, which can be a significant advantage in some applications.
    3. **Local Context**: Despite its limitations, the fact that n-gram models consider local context (the n-1 previous words) is an advantage over bag-of-words models, which ignore context altogether.
    4. **No Need for Training**: Unlike neural network models, n-gram models don't need to go through a time-consuming and potentially tricky training process. Once you've counted the n-grams in your text, you're done.
    5. **Useful for Certain Tasks**: Despite their limitations, n-gram models can perform well on certain tasks, especially ones that mainly rely on local word order. They have been successfully used in applications like spell-checking, keyword extraction, and some aspects of machine translation.
    6. **Interpretability**: The predictions of n-gram models are relatively interpretable. If an n-gram model assigns a high probability to a particular piece of text, you can look at the n-grams in that text to see why.
    7. **Flexibility**: N-gram models can be used with any sequence

### Contexto es todo lo que necesitas

Durante los años 90 el paradigma cambió poco, los modelos de ngramas estaban presentes
en todos los sistemas de procesamiento de lenguaje natural. Incluso con valores de N muy
pequeños, el valor del modelo de lenguaje en el reconocimiento de formas es brutal. No
era posible generar textos con sentido, ya que el contexto era minúsculo (3gramas o
4gramas como mucho era lo habitual). Pero la integración del lenguaje a las evidencias
acústicas en un reconocedor de voz permitía escapar de las inmensas dificultades
encontradas en el lenguaje hablado (fonemas mal pronunciados, elipsis de fonemas,
intercambio de fonemas, entonaciones incorrectas, ...).

En los años 90 las principales aportaciones fueron:

1. Desarrollo de las técnicas de suavizado que permitieran hacer inferencia de las probabilidades
   condicionales para contextos no vistos en el entrenamiento.
2. Creación del concepto de "modelo de lenguaje con caché", que permitía al modelo de ngramas
   original extender la longitud de su contexto, pudiendo capturar un resumen de la información
   intercambiada entre una persona y una máquina durante una interacción, por ejemplo, en un
   proceso de compra de billetes de tren usando la voz.
3. El [suavizado Kneser-Ney](https://en.wikipedia.org/wiki/Kneser%E2%80%93Ney_smoothing) se convierte en
   el standard de facto (1994).

En paralelo a estas aportaciones, en el campo de las redes neuronales artificiales hubo
algunos avances que luego fueron cruciales para el salto de calidad de los sistemas de
reconocimiento. A finales de los 90 se empezaron a desarrollar las LSTMs que permitían
mitigar los problemas de olvido de los modelos de redes neuronales artificiales
recurrentes, aunque harían falta algunos años más para que los recursos computacionales
y de datos permitiran aprovechar su potencial.

TERTULIANOS, ATAQUEN DE NUEVO
  
Antes de seguir con modelos más complejos, comentamos sobre el [Huge Language Models and Stupid Backoff](https://aclanthology.org/D07-1090.pdf).
En 2007, Google dice, dejémonos de algoritmos avanzados para suavizar los ngramas. Lo que hace falta son **muchos datos**, y yo los tengo:
**2 trillion tokens, resulting in 5-gram language models having up to 300 billion n-grams**
  
> Significantly, we found that translation quality as indicated by BLEU score continues to improve with
> increasing language model size, at even the largest sizes considered. This finding underscores
> the value of being able to train and apply very large language models, and suggests that further
> performance gains may be had by pursuing this direction further.
  
¿Qué os parece esta demostración de fuerza bruta? ¿Analogías con la realidad actual?

??? note "Comparison of training datasets sizes "

    - Google Ngrams, 2 trillion tokens, 300B ngrams
    - GPT2: 40GB, ~0.04 trillion tokens, 1.5B parameters
    - GPT3: 570GB, 0.4 trillion tokens, 175B parameters
    - Google Palm: 0.78 trillion tokens, 540B parameters

### Se nos olvidaron los espacios de variedades: modelos de lenguaje basados en redes neuronales

Referencia: http://www.scholarpedia.org/article/Neural_net_language_models va muy mal, pero es la referencia más completa.
  
En los albores del año 2000, comenzó a proponerse una forma de mitigar "la maldición de la dimensionalidad" que surfían los modelos
de ngramas. En 2001, el paper [A Neural Probabilistic Language Model](http://www.iro.umontreal.ca/~lisa/pointeurs/BengioDucharmeVincentJauvin_jmlr.pdf).
La inspiración de estos modelos proviene de los estudios de los 80 en el campo de las redes neuronales artificiales, donde se estudiaba cómo representar
objetos en la forma de vectores de características, lo que ahora llamamos "embedding". Estos "embeddings" son especialmente interesantes para representar
palabras, y el modelo de lenguaje conexionista (o neural) nace de la inferencia de una distribución de probabilidad de las palabras de un vocabulario
sobre una secuencia de contexto donde se pone el embedding de cada palabra. Desde entonces han aparecido multitud de formas para hacer la inferencia:
  
- Usando modelos "feed-forward" (MLPs).
- Usando redes recurrentes (RNNs).
- Con modelos recurrentes tipo LSTM.
- Con skip-grams (word2vec).

Todos ellos superan las limitaciones de los ngramas gracias a los embeddings, y tal cual "Paco Zamora" lo entiende, los inicios del "deep learning"
actual están en estos trabajos de los 80 en como representar información de forma más eficiente, y su extensión después al lenguaje. Es ahí donde
más están reluciendo los modelos de "deep learning", como ya hemos comentado por este foro en las anteriores ediciones. Sin embargo, estos
modelos siguen teniendo problemas importantes, sobretodo desde el punto de vista del aprendizaje. El espacio de características sobre el que
se calcula la distribución de probabilidad de la palabra siguiente es muy grande. Escalarlo necesita estrategias más acertadas que simplemente
concatenar embeddings.


??? warning "Limitaciones de las RNN"

    1. **Vanishing Gradient Problem**: This is a key challenge in RNNs. It arises due to the repeated multiplication of gradients through layers during backpropagation, which can result in gradients that are exponentially small. This makes it difficult for the model to learn and tune the parameters associated with the earlier layers, as they receive very little gradient update. Consequently, the network struggles to learn long-range dependencies in the data.
    2. **Exploding Gradient Problem**: This is the opposite of the vanishing gradient problem, where the gradient becomes too large, causing an unstable learning process. While this problem can be managed through techniques like gradient clipping, it is still a challenge inherent in RNNs.
    3. **Difficulty in Learning Long-range Dependencies**: While theoretically RNNs can capture long-range dependencies due to their recurrent nature, in practice they struggle to do so because of the vanishing gradient problem. This makes it difficult for an RNN to learn from inputs that are far apart, which is a common scenario in many language modelling tasks.
    4. **Sequential Computation**: RNNs process data in a sequential manner, making it hard to parallelize operations. This can lead to longer training times compared to models that can process input data in parallel, such as Transformer-based models.
    5. **Lack of Temporal Hierarchical Modelling**: In many natural language tasks, information is often presented at different scales (e.g., word-level, phrase-level, sentence-level, etc.). RNNs, however, process data at the same scale, which can make it challenging for them to effectively model these different levels of information.
    6. **Memory Limitations**: RNNs have a limited "memory" capacity, meaning they may struggle to maintain context over long sequences of text. This is a significant limitation for many language tasks where understanding the full context is crucial.

    To address some of these issues, variations of RNNs such as Long Short-Term Memory (LSTM) and Gated Recurrent Unit (GRU) networks have been developed. More recently, attention-based models like the Transformer have gained popularity due to their ability to better handle long-range dependencies and parallelize computations.

??? success "Ventajas de las RNN"

    1. **Handling Sequential Data**: RNNs are explicitly designed to work with sequential data. In language modeling, the order of words is critical for understanding meaning, and RNNs excel at capturing these kinds of temporal dynamics. Each output is dependent on previous computations, allowing for the propagation of information through time.
    2. **Parameter Sharing Across Time Steps**: In an RNN, the same weights are used for each time step of the input sequence. This sharing of parameters greatly reduces the total number of parameters that the model needs to learn, making the model more efficient.
    3. **Ability to Process Different Lengths of Sequences**: RNNs can handle input sequences of varying lengths, which is essential for many language tasks where sentences or documents can be of different lengths. The model dynamically adjusts to the length of the input sequence.
    4. **Modelling Temporal Dependencies**: RNNs have the potential to connect previous information to the present task, such as using previous words to inform the next word in a sentence. This ability to model temporal or sequential information is crucial in language modeling.
    5. **Online Learning**: Since RNNs process data sequentially, they can begin processing input sequences before having seen all the data. This makes them suitable for online learning tasks, where data becomes available gradually over time.
    6. **Use in Many Applications**: RNNs have been used successfully in many language processing tasks, including machine translation, speech recognition, text generation, and sentiment analysis.

### Atención y contexto: seq2seq, los transformers y compañía

Ya más recientemente, estos modelos empiezan a extenderse con componentes recurrentes que permiten de forma general transformar secuencias en secuencias, por
ejemplo para traducir [2014, Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215). Estos superaban muchas de las limitaciones
del aprendizaje para hacer inferencia con concatenaciones de embeddings, usando componentes GRU o LSTM para facilitar el procesado de secuencias de longitud
arbitraria. Pero aun así, el aprendizaje de los componentes recurrentes es muy complejo y todavía no podía escalarse más allá de algunas decenas de palabras
activas en la memoria. Y así llegamos a la época contemporánea, 2017, [Attention is all you need](https://arxiv.org/pdf/1706.03762.pdf), proponen usar
módulos de atención y nada más, proponiendo la primera arquitectura transformer que de forma satisfactoria hacía competencia al estado del arte, y
que se convierte en los modelos de lenguaje que tenemos ahora.
 
La verdad es que, hace 10 años nadie hubiera predecido la capacidad de estos modelos de lenguaje, donde en mi humilde opinión, lo que de forma muy inteligente
se ha sabido explotar es el contexto de las palabras. Permitir modelos que pueden procesar miles de palabras en su contexto hace que la distribución de
probabilidad de las palabras esté muy condicionada, lo que permite al modelo producir respuestas muy acertadas ante multitud de entradas diferentes.
Creo que en el fondo de esta historia está este propósito, desde los modelos más simples, vemos como añadir cada vez más contexto ha motivado que
pensemos estrategias de aprendizaje y modelado que puedan escalar cada vez más lejos. Y de ahí hemos visto aparecer comportamientos emergentes que no
eran esperables. Qué momento más emocionante para la inteligencia artificial, e importante para toda la humanidad, en tanto en cuanto como especie
es una responsabilidad muy grande la de desarrollar estas tecnologías y saber aprovecharlas de la forma adecuada.

  
??? warning "Limitaciones de los Transformers"

    1. **Computational resources**: Transformers require a significant amount of computational resources for both training and inference. This includes not only hardware like GPUs or TPUs, but also a large amount of electricity, which may not be sustainable in the long term.
    2. **Data requirement**: Transformers require a massive amount of data for training. If you have a language or domain with limited data available, it could be challenging to train a Transformer model effectively.
    3. **Understanding context**: While Transformers are good at generating coherent sentences, they can sometimes struggle with long-term dependencies and the overall context of a piece of text. This can lead to inconsistencies in the generated text, particularly over longer passages.
    4. **Lack of common sense and world knowledge**: Despite their impressive performance on many tasks, Transformer models often lack common sense understanding and can make obvious factual mistakes. They are fundamentally statistical machines, and their understanding of the world is limited to the patterns they have learned from their training data.
    5. **Ethical concerns**: Transformers can inadvertently generate inappropriate or harmful content, and can be biased in ways that reflect the biases in their training data. While there are techniques to mitigate these issues, they are not perfect and can sometimes lead to outputs that are problematic.
    6. **Interpretability**: Transformer models are complex and difficult to interpret. It's often unclear why they made a particular prediction or how they arrived at a specific output.
    7. **Overfitting to training data**: Transformers can sometimes overfit to their training data, which can lead to them generating text that is overly similar to their training data, or failing to generalize well to new contexts or prompts.
    8. **Dependency on prompt**: The quality and relevancy of output heavily depends on how the input prompt is phrased. Small changes in the prompt can sometimes lead to very different outputs.
    9. **Lack of incremental learning**: As of my knowledge cutoff in September 2021, Transformer models like GPT-4 cannot learn incrementally. They are trained in one shot, and then they are fixed. They cannot learn from new data or experiences without a full retraining.
    10. **Lack of Multi-Modal capabilities**: While there are models that combine Transformers with other architectures to handle multi-modal data (like text and images together), the Transformer architecture itself is not inherently suited to multi-modal tasks.

??? success "Ventajas de las Transformers"

    1. **Attention Mechanism**: Transformers introduce the concept of self-attention or attention mechanism, which allows them to weigh the importance of different words in an input sequence when generating an output. This allows them to handle long-term dependencies in text better than previous architectures like RNNs or LSTMs.
    2. **Parallelization**: Unlike RNNs and LSTMs, which process sequences step by step, Transformers process the entire sequence at once. This allows for better utilization of modern hardware and significantly speeds up training and inference times.
    3. **Scalability**: Transformers have proven to be highly scalable with increasing amounts of data and compute. As models like GPT-3 and GPT-4 have shown, Transformers can leverage billions or even trillions of parameters to learn from vast amounts of text data.
    4. **Versatility**: Transformers have proven to be highly versatile and have achieved state-of-the-art results across a wide range of tasks, including text generation, translation, summarization, question-answering, and more.
    5. **Transfer Learning**: Transformers can be pre-trained on a large corpus of text and then fine-tuned on a specific task with a smaller amount of data. This allows them to leverage knowledge learned from a wide range of text and apply it to specific tasks, often resulting in strong performance even with relatively little task-specific data.
    6. **Language Understanding**: Transformers have shown a remarkable ability to generate human-like text and to understand the structure and semantics of language. They can generate coherent and contextually relevant sentences, and even write creative content like poetry or stories.
    7. **Contextualized Word Representations**: Unlike traditional word embeddings like Word2Vec or GloVe, Transformers generate word representations that take into account the context in which a word is used. This allows them to understand nuances of language like polysemy (words with multiple meanings), which traditional word embeddings struggle with.
    8. **Zero-Shot and Few-Shot Learning**: Transformers, especially large ones like GPT-3 and GPT-4, have demonstrated the ability to perform tasks in a zero-shot or few-shot setting, where they generate outputs for a task they haven't been specifically trained on, guided only by a few examples or a description of the task in the input prompt.
    9. **Multilinguality**: Many Transformer models, like GPT-3 and mBERT, are trained on text from multiple languages and can generate text in or translate between multiple languages.

  
## Debate final
  
Y vamos a abrir un poco de debate sobre todo lo comentado
  
 TERTULIANOS
  
- ¿Hasta donde podremos escalar la adición de contexto a los modelos? 
- ¿Qué nos depara el futuro?
  
Y damos paso a la discusión propuesta por Guille al respecto de los sesgos inductivos de las arquitecturas de redes neuronales.
  
### Sesgos inductivos de las diferentes arquitecturas
  
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
