# Escala y Emergencia. ¿Destellos de Inteligencia Artificial General?

_12/04/2023_

La idea es que está tertulia sea más corta, algunos de los oyentes piden tertulias más cortas. Esto sería una prueba para ver que tal funciona un formato distinto. Debería ser de menos de una hora.

## Introducción

## Preguntas de los oyentes

## Tema en profundidad

### Que es la emergencia

- [Emergencia Wikipedia](https://es.wikipedia.org/wiki/Emergencia_(filosof%C3%ADa))

#### Ejemplos emergencia

- Células -ser vivo
- Pájaros bandada
- Hormigas
- Mente vs Neuronas
- [Juego de la vida](https://es.wikipedia.org/wiki/Juego_de_la_vida)
- Sociedad vs persona (cohetes)
- [Social behaviour as an emergent property of embodied curiosity: a robotics perspective](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6452242/)

#### Escala en la sociedad humana

| año   | población |
|-------|-----------|
| -8000 | 8e6       |
| 0     | 2e8       |
| 2022  | 8e9       |

https://ourworldindata.org/grapher/population?yScale=log

La escala permite una mayor especialización de los trabajos. También aumenta el número de genios que pueden contribuir a avanzar la ciencia.

_¿Como sería el ritmo del avance científico si fueramos 1e11 personas? ¿O una civilización interplanetaria con 1e12?_

### Emergencia en IA

#### Palm, capacidades emergentes

![palm_visualization](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgLXCWMlipdu0gFF6hsiJHbxg1zSaEkdDWfl-8RakQuW__8RPvlOS9KGIScNCytxT4jz9isnx0GLMwbS1G0Q4WdXzT42GszgfwIIAVX1H3J-43lVWWqcb--q9cPsxCsJFFz2dRfpKgEmLe-xfIyBqQuPq1BPYcK9CtAK1_xnhgvgAAx0GeZmODJxGNMYQ/s16000/image8.gif)

- [PaLM: Scaling Language Modeling with Pathways](https://arxiv.org/abs/2204.02311)
- [Pathways Language Model (PaLM): Scaling to 540 Billion Parameters for Breakthrough Performance](https://ai.googleblog.com/2022/04/pathways-language-model-palm-scaling-to.html?m=1)
- [Characterizing Emergent Phenomena in Large Language Models](https://ai.googleblog.com/2022/11/characterizing-emergent-phenomena-in.html)

> **Scaling laws**. Scaling up the size of language models often leads to improved performance and sample efficiency on a range of downstream NLP tasks. In many cases, the performance of a large language model can be predicted by extrapolating the performance trend of smaller models. For instance, the effect of scale on language model perplexity has been empirically shown to span more than seven orders of magnitude.
>
> On the other hand, performance for certain other tasks does not improve in a predictable fashion. For example, the GPT-3 paper showed that the ability of language models to perform multi-digit addition has a flat scaling curve (approximately random performance) for models from 100M to 13B parameters, at which point the performance jumped substantially.
>
> **emergent abilities**, which we define as abilities that are not present in small models but are present in larger models. The existence of such emergent abilities raises the question of whether additional scaling could potentially further expand the range of capabilities of language models.

![emergent_capacities](res/emergent_capacities.png)

> The ability to perform multi-step arithmetic (left), succeed on college-level exams (middle), and identify the intended meaning of a word in context (right) all emerge only for models of sufficiently large scale. The models shown include LaMDA, GPT-3, Gopher, Chinchilla, and PaLM.

Algunas de las capacidades emergentes de PaLM:

- Aritmetica de multiples pasos
- Preguntas de examen universitario
- Significado de una palabra según el contexto
- Explicaciones paso a paso “chain-of-thought prompting”

#### [GPT4](https://openai.com/research/gpt-4)

- Multimodal
- Clara mejora respecto a 3 y 3.5
- Desconocemos su tamaño, arquitectura, entrenamiento...

> It passes a simulated bar (lawyer) exam with a score around the top 10% of test takers; in contrast, GPT-3.5’s score was around the bottom 10%. (un examen que hace falta pasar para poder ejercer como abogado
> In a casual conversation, the distinction between GPT-3.5 and GPT-4 can be subtle. The difference comes out when the complexity of the task reaches a sufficient threshold—GPT-4 is more reliable, creative, and able to handle much more nuanced instructions than GPT-3.5.

TODO:

- [Sparks of Artificial General Intelligence: Early experiments with GPT-4](https://arxiv.org/abs/2303.12712) 450 hojas!
- [Gary Markus: The Sparks of AGI? Or the End of Science?](https://garymarcus.substack.com/p/the-sparks-of-agi-or-the-end-of-science)
- [AI Explained Video: Sparks of AGI](https://youtu.be/Mqg3aTGNxZ0)
- [AI Explained Video: Theory of Mind](https://www.youtube.com/watch?v=4MGCQOAxgv4)

### Futuro IA: scale is all you need?

TODO:

Basta con ordenadores más potentes y entrenar con todo internet: audio, video, fotos, texto...?

- Nando freitas [game over flamingo](https://twitter.com/NandoDF/status/1523591529671012354)
- [DeepMind’s astounding new ‘Gato’ AI makes me fear humans will never achieve AGI](https://thenextweb.com/news/deepminds-astounding-new-gato-ai-makes-fear-humans-will-never-achieve-agi)
- [Is the human brain just a scaled primate brain?](https://twitter.com/Tim_Dettmers/status/1637594465065119744?s=20)

![comparison_primate_brains](res/comparison_primate_brains.png)

#### ¿Hay límites en el escalado de los LLM?



#### LLM -> Large World Models

- [AI Explained Video: What's Left Before AGI? PaLM-E, 'GPT 4' and Multi-Modality](https://www.youtube.com/watch?v=EzEuylNSn-Q)



#### Petición para paralizar entrenamiento de modelos más grandes que GPT4

Firmada por Gary Markus, Elon Musk...

https://futureoflife.org/open-letter/pause-giant-ai-experiments/

> This does not mean a pause on AI development in general, merely a stepping back from the dangerous race to ever-larger unpredictable black-box models with emergent capabilities.

_Implicitamente están diciendo que "scale is all you need", ¿Es peligroso GPT4? ¿Hay que parar los entrenamientos? ¿Es realista pensar que una pausa es posible? ¿Va a parar China o va a redoblar esfuerzos?_

## Recomendaciones

- [AI Explained Youtube channel](https://www.youtube.com/@ai-explained-) Se ha creado en Enero de 2023 y ya tiene ~100k suscriptores.

## Despedida

<!-- 

Esto lo dejo comentado por el momento porque la idea es hacer una tertulia más corta que las anteriores

## Noticias de las últimas semanas

- GPT-4
- [Google Bard](https://bard.google.com/)
- [An important next step on our AI journey](https://blog.google/technology/ai/bard-google-ai-search-updates/)

-->
