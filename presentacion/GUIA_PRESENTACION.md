# Guía para construir la presentación final

**Para:** Angie Tobar · **Duración:** 30–45 min (meta: ~38 min de exposición + preguntas) · **Expositores:** Angie Tobar y Alejandro Pardo

Todo el contenido ya está listo y verificado. Esta guía dice **qué va en cada diapositiva, qué figura usar, quién habla,
cuánto tiempo y qué criterio de la rúbrica cubre**. Solo hay que armar las diapositivas.

## Recursos disponibles

| Recurso | Dónde |
|---|---|
| Figuras (PNG, 300 dpi, listas para pegar) | `results/figures/fig01` … `fig13` |
| Texto completo con todas las cifras | `docs/documento_proyecto.md` |
| Paper final (PDF) | `paper/Paper_Healtech_Final.pdf` |
| Diseño base (mismo estilo de las presentaciones anteriores) | `archivo/semestre_2_presentaciones_previas/Presentacion_Estructura_Tablero.html` (Reveal.js: se puede copiar y reemplazar el contenido) |
| Rúbrica con la que nos evalúan | `docs/lineamientos/Rubrica_evaluacion_pares.docx` |

## ⚠️ No usar estas cifras viejas (venían de la etiqueta invertida de Kaggle)

| ❌ Viejo | ✅ Correcto |
|---|---|
| «FC > 162 lpm = mayor riesgo, OR 9,17» | FC **≤ 162** lpm se asocia con EC (OR 4,67); una FC alta es **protectora** |
| «Modelo logístico: exactitud 77,1 %, AUC 0,838» | Modelo básico: AUC **0,874** (validación cruzada); 0,880 corregido |
| «Artículo: 100 % de sensibilidad confirma nuestros hallazgos» | Coincidimos en la dirección, pero el artículo usa 61 pacientes de prueba (poco robusto) |
| «Enfermedad cardíaca» | **Enfermedad coronaria** confirmada por angiografía (estenosis > 50 %) |

---

## Estructura diapositiva por diapositiva

*El reparto entre expositores es una propuesta: Angie lleva el contexto clínico y la discusión; Alejandro, los datos, los métodos y los resultados. Ajústenlo como prefieran.*

| # | Diapositiva | Contenido clave | Visual | Quién | Min | Rúbrica |
|---|---|---|---|---|---|---|
| 1 | **Portada** | Título, autores, U. Externado, HealthTech 1 y 2 | Logo | Angie | 0,5 | A |
| 2 | **Agenda** | Problema → objetivos → métodos → resultados → conclusiones | — | Angie | 0,5 | J |
| 3 | **Contexto epidemiológico** | 19,2 M de muertes por ECV en 2023 (1 de cada 3); 315 M de casos de EC; 5,6 M de colombianos afectados | 3 cifras grandes | Angie | 1,5 | B |
| 4 | **¿Qué es la enfermedad coronaria y cómo se diagnostica?** | Placa aterosclerótica; diagnóstico escalonado: historia → ECG → prueba de esfuerzo → imagen → **angiografía** (estándar de oro, invasiva) | Esquema escalonado | Angie | 2 | B |
| 5 | **Problema** | **Qué ocurre:** 160 de 297 remitidos (53,9 %) **no** tenían EC. **Causas:** síntomas atípicos (47,8 % asintomáticos), información dispersa. **Consecuencias:** procedimientos invasivos innecesarios y costos | Tabla de 3 filas | Angie | 2 | C |
| 6 | **Justificación** | Costos en Colombia ($17–29 M COP por evento); beneficiarios (pacientes, hospitales, EPS); idea: anticipar con variables de bajo costo | Íconos de beneficiarios | Angie | 1,5 | B |
| 7 | **Antecedentes y vacío** | Diamond-Forrester (1979), Detrano (1989, origen de la base), CAD Consortium (2011). **Vacío:** evaluaciones con 1 partición, sin calibración, mezclando imagen y variables de consulta | Tabla «se sabe / falta» | Angie | 2 | B |
| 8 | **Pregunta y objetivo general** | Pregunta de investigación + objetivo general | Texto | Angie | 1 | E |
| 9 | **Objetivos específicos** | OE1 describir · OE2 asociar · OE3 predecir · OE4 aporte de la imagen · OE5 contrastar | Lista numerada | Angie | 1 | F |
| 10 | **Hipótesis** | General + H-1 a H-4 (H0/H1) | Tabla H0/H1 | Alejandro | 1,5 | D |
| 11 | **Diseño, población y muestra** | Observacional analítico transversal; 303 → 297 (inclusión/exclusión); muestreo; Cleveland, años 80; tamaño de muestra (Riley: requerido 412, disponible 297 → mitigación) | `fig02_flujo_muestra.png` | Alejandro | 2 | G |
| 12 | **Variables** | Dependiente: EC. Independientes en 3 grupos: factores de riesgo · marcadores clínicos · imagen | Tabla de 3 columnas | Alejandro | 1,5 | G |
| 13 | **Control de calidad: ¡la base de Kaggle estaba invertida!** | Etiqueta invertida al 100 %, 3 variables recodificadas, faltantes ocultos, 1 duplicado → se usa la base oficial UCI (SHA-256) | `fig01_auditoria_kaggle_vs_uci.png` | Alejandro | 2 | G |
| 14 | **Flujo de análisis** | Descriptivo → paso preliminar (lineal) → asociación (OR) → modelos predictivos → validación. Herramientas: Python, notebooks reproducibles, GitHub | Diagrama de flechas | Alejandro | 1,5 | G |
| 15 | **¿Cómo validamos?** | Validación cruzada 5 × 20 (100 evaluaciones), bootstrap, DeLong, calibración | `fig10_auc_validacion_cruzada.png` | Alejandro | 2 | G |
| 16 | **Resultados: la cohorte (OE1)** | Con EC: mayores, más hombres (81,8 %), más asintomáticos (75,2 %), menor FC máxima (142 frente a 161) | `fig03` o `fig04` | Angie | 2 | — |
| 17 | **Paso preliminar: ¿por qué no regresión lineal?** | MLP: 43 predicciones fuera de [0, 1]; PA: residuos no normales y heterocedásticos → logística | `fig12_regresion_lineal_preliminar.png` | Alejandro | 1,5 | G |
| 18 | **OR por rangos** | ST ≥ 1 mm: OR 5,06 · FC < 85 % de la esperada: OR 4,88 · edad ≥ 55: OR 3,39 · PAS ≥ 140: OR 1,72 · colesterol ≥ 240: no significativo | `fig13_or_por_rangos.png` | Angie | 2 | — |
| 19 | **Factores independientes (H-1)** | Dolor asintomático OR 10,6 · sexo masculino OR 7,5 · depresión del ST OR 1,8/mm · FC protectora (límite) · colesterol no | `fig06_forest_odds_ratios.png` | Alejandro | 2,5 | D |
| 20 | **Desempeño de los modelos (H-2, H-3, H-4)** | Básica 0,874 · extendida 0,909 · árbol 0,842 · RF 0,910. La imagen suma +0,035; la RL le gana al árbol | `fig07_curvas_roc.png` + tabla | Alejandro | 2,5 | D |
| 21 | **Calibración y uso clínico** | Pendiente 0,91 (ideal 1). Con sensibilidad del 90 %: detecta 124/137 enfermos y descarta 98/160 sanos | `fig08` + `fig11` | Alejandro | 2 | — |
| 22 | **El árbol de decisión: reglas interpretables** | 1.ª división: dolor asintomático → vasos → talio → pendiente del ST. Útil para explicar, peor para predecir (sobreajuste) | `fig09_arbol_decision.png` | Angie | 1,5 | — |
| 23 | **Discusión** | Coherencia con la literatura; FC = incompetencia cronotrópica; ¿por qué no el colesterol?; contraste con Chandrasekhar (2023) | Tabla comparativa | Angie | 2,5 | B/I |
| 24 | **Limitaciones y ética** | Años 80, EE. UU., sesgo de espectro, n < recomendado, faltan tabaquismo/estatinas → mitigación. Ética: Res. 8430/1993 (sin riesgo), Ley 1581/2012 | Tabla | Angie | 1,5 | G |
| 25 | **Viabilidad: cronograma, instituciones y presupuesto** | Fases F1–F10; Externado, UCI, Cleveland Clinic; presupuesto de $8,98 M COP (94 % en especie) | Línea de tiempo + tabla | Alejandro | 1,5 | H |
| 26 | **Conclusiones** | Las 5 conclusiones (§14 del documento) | Lista | Angie | 1,5 | — |
| 27 | **Referencias** | Vancouver (las principales) | Lista | — | 0 | I |
| 28 | **Gracias · Preguntas** | Enlace al repositorio de GitHub | — | Ambos | — | J |
| | | | | **Total** | **~44** | |

> Si hay que recortar para llegar a unos 35 min, fusionen 3+4, 8+9 y 21+22, y muestren la 25 rápido.

---

## Guion sugerido (lo esencial por diapositiva)

**3 · Contexto.** «Las enfermedades cardiovasculares causaron 19,2 millones de muertes en 2023: una de cada tres en el mundo. En Colombia afectan a 5,6 millones de personas.»

**4 · Diagnóstico.** «El diagnóstico definitivo de la enfermedad coronaria es la angiografía: se introduce un catéter y se mide cuánto están obstruidas las arterias. En nuestra base, "enfermo" significa una obstrucción de más del 50 % en al menos una arteria mayor. Así lo define la documentación oficial de la base.»

**5 · Problema.** «En nuestra cohorte, más de la mitad de los pacientes que fueron a angiografía no tenían la enfermedad. Pasaron por un procedimiento invasivo y costoso que, en retrospectiva, no necesitaban.»

**7 · Vacío.** «Esta base se usa mucho en *machine learning*, pero casi siempre se evalúa con una sola partición de unos 60 pacientes, sin calibración, y mezclando exámenes de imagen con variables de consulta. Nosotros quisimos saber cuánto se puede predecir **solo con lo barato**.»

**10 · Hipótesis.** «Nuestra hipótesis general se desglosa en cuatro pruebas formales, cada una con su hipótesis nula. Al final verán que en las cuatro rechazamos la nula.»

**11 · Muestra.** «Excluimos 6 pacientes por datos faltantes y trabajamos con 297. Según los criterios de Riley, lo ideal serían unos 400. Por eso controlamos el sobreajuste con penalización, validación repetida y corrección de optimismo.»

**13 · Control de calidad.** «Este es quizás nuestro hallazgo más importante. La versión de Kaggle que usamos en el primer semestre tenía el diagnóstico invertido en el 100 % de los casos. Lo descubrimos comparando registro por registro con la base oficial. Por eso llegamos a la conclusión fisiológicamente absurda de que una frecuencia alta era un factor de riesgo. Corregirlo cambió las conclusiones.»

**15 · Validación.** «Si evaluáramos el modelo con los mismos pacientes con que lo entrenamos, sería como aprenderse las respuestas del examen. Dividimos a los pacientes en 5 grupos: entrenamos con 4 y probamos con el quinto, rotando, y repetimos esto 20 veces. Son 100 evaluaciones. Esta figura muestra por qué: con una sola partición, el modelo del semestre pasado podía dar un AUC de 0,61 o de 0,87, según qué pacientes cayeran en la prueba.»

**17 · Paso preliminar.** «Primero miramos el tipo de variable. El diagnóstico es binario, sí o no. Si usamos regresión lineal, 43 pacientes reciben "probabilidades" negativas o mayores que 1, lo cual es imposible. La regresión logística resuelve esto con la función sigmoide.»

**18 · OR por rangos.** «Usamos puntos de corte que ya existen en la práctica médica, no unos inventados a partir de los datos. Un paciente con depresión del ST de 1 mm o más tiene 5 veces más odds de enfermedad coronaria. Uno cuyo corazón no llega al 85 % de la frecuencia esperada para su edad, lo que se llama incompetencia cronotrópica, también tiene unas 5 veces más odds.»

**19 · Factores independientes.** «Al ajustar por todo a la vez, quedan tres factores sólidos: no tener dolor típico (isquemia silente, OR 10,6), ser hombre (OR 7,5) y la depresión del ST (OR 1,8 por mm). Llama la atención el colesterol, que no se asocia, y lo explicaremos en la discusión.»

**20 · Modelos.** «Con solo variables no invasivas alcanzamos un AUC de 0,874. Añadir la imagen sube el AUC 3,5 puntos: es significativo, pero modesto. El Random Forest no le ganó a la logística, y el árbol fue el peor.»

**21 · Uso clínico.** «Si exigimos detectar al 90 % de los enfermos, el modelo todavía descarta correctamente a 6 de cada 10 sanos. Podría ayudar a priorizar a quién remitir, pero necesita validación externa antes de usarse.»

**23 · Discusión: el colesterol.** «El colesterol daña durante décadas, mientras que la prueba de esfuerzo muestra la enfermedad que ya está instaurada. Además, todos estos pacientes ya eran de alto riesgo, y no sabemos quién tomaba estatinas. Eso no significa que el colesterol no importe en la prevención.»

---

## Cifras clave (para tenerlas a mano)

| Dato | Valor |
|---|---|
| Pacientes | 303 → **297** analizados (160 sin EC, 137 con EC = 46,1 %) |
| Excluidos | 6 (faltantes: `ca` 4, `thal` 2) |
| Tamaño requerido (Riley) | 412 (básico) / 382 (extendido) |
| Dolor asintomático (ajustado) | OR **10,60** (3,17–35,40) |
| Sexo masculino (ajustado) | OR **7,48** (3,25–17,20) |
| Depresión del ST (ajustado) | OR **1,82** por mm (1,23–2,69) |
| FC máxima (ajustado) | OR **0,82** por cada 10 lpm (0,68–1,00), p = 0,048 |
| Colesterol (ajustado) | OR 1,21 (0,92–1,58), p = 0,175 → **no significativo** |
| AUC RL básica | **0,874** (CV) · 0,880 (corregido) · IC 0,836–0,914 |
| AUC RL extendida | 0,909 |
| AUC árbol / Random Forest | 0,842 / 0,910 |
| Aporte de la imagen | +0,035 (IC 0,008–0,062), p = 0,012 |
| RL vs. árbol | +0,067, p = 0,004 |
| Pendiente de calibración (básica) | 0,91 (ideal = 1) |
| Con sensibilidad del 90 % | Especificidad del 61 %, VPN del 88 % |

## Preguntas probables y cómo responderlas

| Pregunta | Respuesta |
|---|---|
| ¿Por qué cambiaron los resultados respecto al semestre pasado? | «Detectamos que la base de Kaggle tenía la etiqueta invertida. Al usar la oficial, la dirección de los efectos se corrigió. Es control de calidad.» |
| ¿Cómo saben que está invertida? | «Emparejamos los 303 registros con la base oficial de UCI. El 100 % de los "enfermos" de Kaggle son "sanos" en UCI. Además, fisiológicamente, un corazón isquémico alcanza **menor** frecuencia en el esfuerzo.» |
| ¿Por qué no usaron solo Random Forest o *deep learning*? | «Probamos Random Forest: empató con la logística (0,910 frente a 0,909, p = 0,94), pero está peor calibrado y no es interpretable. Con 297 pacientes, un modelo más complejo no aporta.» |
| ¿Por qué el árbol salió peor? | «Divide a los pacientes en pocos grupos, así que sus probabilidades son escalonadas. Además se sobreajusta (pendiente de calibración de 0,26) y es inestable. Lo usamos para explicar reglas.» |
| ¿Qué es el AUC? | «La probabilidad de que el modelo le asigne más riesgo a un enfermo que a un sano, tomados al azar. 0,5 es azar y 1 es perfecto. Por encima de 0,8 se considera clínicamente útil.» |
| ¿Qué es la calibración? | «Si el modelo dice 30 % de riesgo, ¿se enferman realmente unos 30 de cada 100? La pendiente ideal es 1; la nuestra es 0,91.» |
| ¿La muestra es suficiente? | «Es menor que la recomendada (412). Lo declaramos como limitación y lo mitigamos con penalización, validación repetida y corrección de optimismo. El optimismo fue de solo 0,02.» |
| ¿Por qué no es significativo el colesterol? | Ver el guion de la diapositiva 23. |
| ¿Por qué la FC es "limítrofe"? | «Su p es 0,048: apenas significativo. Con los 303 pacientes es 0,051. La dirección es consistente, pero la evidencia ajustada es débil, porque comparte información con otras variables de esfuerzo.» |
| ¿Se puede usar en Colombia? | «Todavía no. Son datos de EE. UU. de los años 80. Hace falta validación externa, idealmente con datos colombianos y aval ético.» |
| ¿Qué es OR ajustado frente a crudo? | «El crudo mira una variable sola; el ajustado la mira controlando todas las demás. La edad tiene OR 3,4 sola, pero ajustada deja de ser significativa: parte de su efecto lo explican el sexo y la prueba de esfuerzo.» |

## Lista de chequeo (rúbrica J)

- [ ] Secuencia: problema → objetivos → métodos → resultados → conclusiones
- [ ] Ensayar con cronómetro: 35–40 min
- [ ] Figuras legibles: una idea por diapositiva y poco texto
- [ ] Cada uno domina las preguntas de su bloque y las generales (tabla de arriba)
- [ ] Ninguna cifra vieja (ver el cuadro ⚠️)
