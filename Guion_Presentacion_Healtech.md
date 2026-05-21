# Guion Oficial de Presentación: Predicción de Enfermedades Cardíacas
**Proyecto Final - Healtech 1**
**Integrantes:** Santiago Palacios, Angie Tobar y Alejandro Pardo.

---

## [SANTIAGO PALACIOS] - Introducción y Contexto (Slides 1 a 3)

**Slide 1: Portada**
"Hola a todos, muy buenos días. Nosotros somos el equipo de investigación conformado por Angie Tobar, Alejandro Pardo y su servidor, Santiago Palacios. Hoy les vamos a presentar nuestro proyecto de Healtech 1 enfocado en el Análisis Estadístico y Modelado Predictivo para la detección de enfermedades cardíacas."

**Slide 2: Contexto del Estudio y Dataset**
"Para empezar, es vital entender de dónde provienen nuestros datos. Trabajamos con el dataset 'Heart Disease' de la Fundación Clínica Cleveland, que es un estándar de oro en machine learning médico. Contamos con 303 pacientes y 14 variables clínicas. 
Como pueden ver en pantalla, tras hacer una limpieza exhaustiva, logramos trabajar con 0 valores nulos. Nuestro objetivo es predecir si un paciente tiene la enfermedad o no, enfocándonos en variables clave como la edad, el colesterol, la presión arterial y la frecuencia cardíaca máxima (thalach)."

**Slide 3: Análisis Exploratorio (Distribución Target)**
"El paso cero en cualquier problema clínico es revisar la proporción de los diagnósticos. Afortunadamente, tenemos un dataset muy sano estadísticamente hablando: un 54.5% de pacientes enfermos y un 45.5% sanos. 
*Nota para el público:* Este equilibrio es fundamental porque nos garantiza que nuestro modelo no va a sufrir de sesgos hacia una clase mayoritaria, y nos permite confiar ciegamente en métricas globales como la Exactitud (Accuracy)."

---

## [ANGIE TOBAR] - Exploración Clínica y Primer Modelo (Slides 4 y 5)

**Slide 4: Distribución de Predictores Continuos**
"Continuando con el análisis poblacional, quisimos entender el comportamiento de nuestras variables. En estas gráficas observamos distribuciones muy interesantes:
Primero, la edad tiene un comportamiento un tanto paradójico aquí: vemos un pico de diagnósticos positivos en pacientes relativamente jóvenes (entre 40 y 55 años). 
En cuanto al colesterol, notamos que hay pacientes que superan peligrosamente los 300 e incluso 400 mg/dl, lo que representa factores de riesgo severos. Y finalmente, notamos que los pacientes enfermos tienden a alcanzar frecuencias cardíacas mucho más altas durante pruebas de esfuerzo."

**Slide 5: Primer Enfoque (Regresión Lineal)**
"Con estos datos en mano, quisimos establecer un 'modelo base' o 'baseline'. Por eso, nuestro primer instinto metodológico fue plantear un modelo de Regresión Lineal Múltiple ajustado mediante OLS, es decir, Mínimos Cuadrados Ordinarios. Queríamos ver si un hiperplano podía predecir directamente nuestra variable objetivo basándose en el peso de cada característica.
En pantalla pueden ver la ecuación resultante, donde el modelo asignó un intercepto (beta cero) y ponderaciones a cada variable. Destaca, por ejemplo, el peso positivo para la frecuencia cardíaca máxima (+0.0079).
Sin embargo, al evaluar el modelo nos topamos con un problema crítico: obtuvimos un R-cuadrado muy pobre, de apenas 0.30. 
El error fundamental aquí fue matemático y conceptual. Al ser nuestro diagnóstico un problema binario discreto (1 o 0), el modelo lineal no tiene restricciones, por lo que arrojaba predicciones continuas sin sentido, como decir que un paciente tenía '1.2' o '-0.1' probabilidades de estar enfermo. Necesitábamos un cambio de paradigma."

---

## [ALEJANDRO PARDO] - Regresión Logística, Evaluación y Conclusiones (Slides 6 a 10)

**Slide 6: Evolución Metodológica (Regresión Logística)**
"Y es aquí donde entra la solución matemática ideal para nuestro proyecto: La Regresión Logística. 
Para arreglar el error del modelo lineal, nosotros mapeamos las características a lo que conocemos como el 'Log-Odds' o logaritmo de las probabilidades, y luego lo pasamos por la función Sigmoide. Lo que hace esta fórmula matemática que ven en pantalla es 'aplastar' o restringir cualquier salida lineal para que caiga estrictamente entre 0 y 1. 
Además, especificamos parámetros robustos en la librería: utilizamos el solver 'LBFGS' para una optimización eficiente de la Máxima Verosimilitud (MLE), y aplicamos una regularización 'L2' (Ridge) para evitar el sobreajuste de los coeficientes (betas).
Esto es revolucionario para nuestro caso porque nos permite transformar la predicción abstracta en una probabilidad clínica real y acotada, dándonos el poder de establecer un umbral de decisión dinámico."

**Slide 7: Evaluación Logística y Matriz de Confusión**
"Para comprobar qué tan bueno es este nuevo modelo, usamos la Matriz de Confusión. En nuestro conjunto de prueba (datos invisibles para la máquina), logramos una exactitud general del 77.1%. 
Pero quiero que nos enfoquemos en la métrica más importante de toda la presentación: **La Sensibilidad**, que alcanzó un sólido 78.1%. 
Clínicamente hablando, en medicina es preferible tener un Falso Positivo (es decir, decirle a un paciente sano que se haga más chequeos por si acaso) que cometer un Falso Negativo (mandar a la casa a un paciente que está a punto de sufrir un infarto). Nuestro modelo logró acotar los falsos negativos a tan solo 7 casos de toda la muestra de prueba, lo cual es un buen punto de partida que debemos perfeccionar."

**Slide 8: Curva ROC y AUC**
"Para re-confirmar el poder discriminativo de nuestro sistema, trazamos la Curva ROC. Mientras que una regresión lineal apenas captaba varianza, nuestro clasificador logístico (la línea turquesa gruesa en la gráfica) logró un Área Bajo la Curva (AUC) de **0.838**. 
En la escala médica, todo modelo por encima de 0.80 se considera muy bueno. Esto demuestra visualmente que el modelo es sumamente capaz de separar y distinguir de manera correcta a un paciente sano de uno enfermo, no importando tanto el umbral que elijamos."

**Slide 9: Conclusiones Principales**
"Para ir cerrando, ¿qué nos llevamos de este proyecto?
1. **Relevancia Clínica:** Ratificamos empíricamente que anomalías en variables como la frecuencia cardíaca máxima y el colesterol fungen como predictores primarios para alertas tempranas en pacientes.
2. **Cambio de Paradigma:** Demostramos la gran lección metodológica de que la Regresión Lineal es insuficiente para clasificaciones estrictas, y que un Clasificador Logístico es la herramienta matemáticamente correcta.
3. **Excelencia en Desempeño:** Logramos un modelo muy sólido, con una sensibilidad cercana al 80%, superando el 'baseline' inicial y demostrando el valor de la estadística predictiva clínica.
Como paso futuro para 'Healtech 2', planeamos atacar ese pequeño porcentaje de error restante utilizando ensambles más complejos, como árboles de decisión (Random Forests)."

**Slide 10: Cierre**
"De parte de Angie, Santiago y mía, muchísimas gracias por su atención a nuestro proyecto final de Healtech 1. Quedamos a su total disposición para la sesión de preguntas."
