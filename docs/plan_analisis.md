# Plan de investigación y análisis estadístico

**Proyecto:** HealthTech 1 y 2 · Pregrado en Ciencia de Datos aplicada a la Salud · Universidad Externado de Colombia
**Investigadores:** Angie Milena Tobar Aguirre · Alejandro Pardo Costo
**Versión:** 2.0 (2026-11-11). Reemplaza el planteamiento del semestre 1 (ver §11, *Cambios frente al semestre 1*).

Este documento es la **fuente única de verdad** del proyecto. El paper (`paper/`) y la presentación (`presentacion/`) deben
coincidir con él. Toda cifra citada sale de `results/resultados.json`, que genera `make all`.
La columna «Rúbrica» indica qué criterio del formato de evaluación por pares cubre cada sección
(`docs/lineamientos/Rubrica_evaluacion_pares.docx`).

---

## 1. Título · Rúbrica A

> **Variables clínicas no invasivas asociadas a enfermedad coronaria angiográfica y desempeño diagnóstico de modelos de
> regresión logística y árboles de decisión en adultos remitidos a angiografía en la Cleveland Clinic Foundation:
> estudio observacional analítico de corte transversal con datos secundarios**

El título nombra el tema (enfermedad coronaria), la población (adultos remitidos a angiografía), las variables (clínicas no
invasivas), los métodos (regresión logística y CART) y el diseño (observacional analítico transversal, datos secundarios).

## 2. Problema de investigación · Rúbrica B y C

| Elemento | Contenido |
|---|---|
| **Qué ocurre** | La enfermedad coronaria (EC) es la principal causa de muerte en el mundo. Su confirmación requiere angiografía coronaria, que es invasiva, costosa y de acceso desigual. Muchos pacientes remitidos por sospecha **no** tienen la enfermedad: en esta cohorte, 160 de 297 (53,9 %). |
| **Causas** | Los síntomas son atípicos o silentes (el 47,8 % de la cohorte era asintomática). La probabilidad pretest se estima de forma imprecisa. Las pruebas no invasivas se interpretan por separado y no de forma integrada. |
| **Consecuencias** | Hay angiografías innecesarias, con riesgo de complicaciones y costo para el sistema (un evento coronario en Colombia cuesta entre $17 y $29 millones COP). También hay diagnósticos tardíos en quienes no son remitidos. |
| **Alternativa propuesta** | Integrar en un modelo estadístico las variables que ya se obtienen en consulta, en el ECG de reposo y en la prueba de esfuerzo, para estimar la probabilidad de EC antes de la angiografía. |
| **Cambio esperado** | Contar con una herramienta de priorización que, con sensibilidad ≥ 90 %, identifique un subgrupo de bajo riesgo que podría evitar o diferir el estudio invasivo. |

**Vacío de conocimiento.** Las reglas clásicas de probabilidad pretest (Diamond-Forrester, Detrano 1989, CAD Consortium)
usan pocas variables. Además, buena parte de la literatura de *machine learning* sobre esta base:
- usa la versión de Kaggle, con etiquetas invertidas y faltantes ocultos (§4.3);
- reporta exactitud sobre una sola partición pequeña (por ejemplo, n = 61), sin validación repetida ni calibración;
- mezcla variables de imagen (`ca`, `thal`) con variables de consulta, lo que impide saber **cuánto aporta lo no invasivo por sí solo**.

Este proyecto cuantifica de forma separada el desempeño del conjunto no invasivo y el valor incremental de la imagen. Lo hace con validación interna rigurosa y reporte de calibración, siguiendo TRIPOD.

**Pregunta de investigación.** En adultos remitidos a angiografía coronaria por sospecha clínica, ¿qué variables clínicas,
del ECG de reposo y de la prueba de esfuerzo se asocian de forma independiente con la presencia de EC angiográfica? ¿Con qué
discriminación y calibración la predice un modelo construido solo con ellas, frente a uno que añade fluoroscopia y gammagrafía con talio?

## 3. Hipótesis · Rúbrica D

| # | H0 | H1 | Prueba | Objetivo |
|---|---|---|---|---|
| H-1 | En el modelo multivariable básico, todos los coeficientes de las variables no invasivas son 0 (β₁ = … = β_k = 0). | Al menos un β_j ≠ 0. | Razón de verosimilitud global; Wald por variable (α = 0,05) | OE2 |
| H-2 | El AUC del modelo básico en validación interna es ≤ 0,80. | AUC > 0,80 (discriminación clínicamente útil). | Límite inferior del IC 95 % del AUC (DeLong) y AUC corregido por optimismo | OE3 |
| H-3 | Añadir `ca` y `thal` no mejora el modelo: AUC_ext = AUC_básico. | AUC_ext > AUC_básico. | t corregido de Nadeau-Bengio sobre 100 particiones; DeLong; razón de verosimilitud anidada | OE4 |
| H-4 | El árbol CART y la regresión logística extendida discriminan igual. | Los AUC difieren. | t corregido de Nadeau-Bengio; DeLong | OE3 |

## 4. Objetivos · Rúbrica E y F

**Objetivo general.** Determinar qué variables clínicas no invasivas se asocian de forma independiente con la enfermedad
coronaria angiográfica, y evaluar la discriminación y la calibración de modelos de regresión logística y árboles de decisión construidos
con ellas, en 297 adultos remitidos a angiografía en la Cleveland Clinic Foundation.

**Objetivos específicos** (en secuencia lógica; cada uno con su producto verificable):

| OE | Objetivo | Producto verificable |
|---|---|---|
| OE1 | Describir las características sociodemográficas, clínicas y de pruebas diagnósticas de la cohorte según la presencia de EC. | Tabla 1, figuras 3–5 |
| OE2 | Estimar la asociación cruda y ajustada (OR e IC 95 %) entre cada variable y la EC. | Tabla 2, figura 6 |
| OE3 | Desarrollar y validar internamente modelos predictivos y comparar su discriminación, calibración y utilidad a umbrales clínicos. | Tablas 3–4, figuras 7, 8, 10, 11 |
| OE4 | Cuantificar el valor diagnóstico incremental de la fluoroscopia (`ca`) y de la gammagrafía con talio (`thal`). | Prueba H-3 |
| OE5 | Contrastar los hallazgos con la literatura científica. | Sección de discusión del paper |

## 5. Tipo y diseño de investigación · Rúbrica G

- **Finalidad:** aplicada.
- **Enfoque:** cuantitativo.
- **Alcance:** analítico (asociación) y predictivo (desarrollo y validación interna de un modelo diagnóstico, tipo 1b de TRIPOD).
- **Diseño:** observacional, de corte transversal, con datos secundarios públicos. La variable de exposición y el desenlace se miden en el mismo episodio diagnóstico. El estándar de referencia es la angiografía coronaria.

## 6. Universo, población y muestra · Rúbrica G

| Elemento | Definición |
|---|---|
| Universo | Adultos con sospecha clínica de enfermedad coronaria. |
| Población de estudio | Pacientes remitidos a angiografía coronaria en la Cleveland Clinic Foundation (Ohio, EE. UU.) incluidos en la base de Detrano *et al.* (1989). |
| Unidad de análisis | El paciente (un registro por paciente). |
| Muestra | Censo de los 303 registros del subconjunto Cleveland. Muestra analítica principal: 297 con datos completos. |
| Inclusión | Registro presente en `processed.cleveland.data`, con angiografía (`num`) y las 13 variables predictoras. |
| Exclusión | Faltante en `ca` (n = 4) o en `thal` (n = 2). Como análisis de sensibilidad, el modelo básico se reajusta con n = 303, porque no usa esas variables. |
| Muestreo | No probabilístico, consecutivo por conveniencia (pacientes remitidos). |
| Ámbito y periodo | Cleveland, Ohio, EE. UU. Datos recolectados en la década de 1980 y donados a UCI en julio de 1988 (*verificar el periodo exacto de reclutamiento en Detrano 1989*). |

**Justificación del tamaño de muestra.**
- Se calcula con los criterios de Riley *et al.* (BMJ 2020) para modelos de predicción binarios: prevalencia de 0,461, contracción ≥ 0,90 y optimismo de R²_Nagelkerke ≤ 0,05.
- Con 14 parámetros y un AUC anticipado de 0,80, el tamaño requerido es n = 412. Para el modelo extendido (17 parámetros, AUC anticipado 0,85) es n = 382.
- La muestra disponible es **n = 297, con 137 eventos**, lo que da 9,8 eventos por parámetro en el modelo básico y 8,1 en el extendido. Es inferior a lo recomendado, así que se declara como limitación.
- **Mitigación:**
  1. Penalización L2 en los modelos predictivos.
  2. Validación cruzada repetida 5 × 20.
  3. Corrección de optimismo por bootstrap (500 réplicas).
  4. Reporte de la pendiente de calibración, que mide la sobreestimación.
- La prevalencia se estima con un margen de ± 5,7 % (IC 95 %).

## 7. Variables · Rúbrica G

La definición conceptual y operacional, la unidad, el tipo, la escala, el rol, las categorías y los faltantes de cada variable están en
[`docs/diccionario_variables.md`](diccionario_variables.md). Ese archivo lo genera automáticamente `notebooks/01_datos_y_auditoria.ipynb` a partir de `notebooks/00_configuracion.ipynb`.

| Clasificación | Variables |
|---|---|
| Dependiente | `ec`: EC angiográfica, estenosis > 50 % en al menos un vaso mayor (derivada de `num`). |
| Independientes. Modelo básico (consulta + ECG de reposo + prueba de esfuerzo) | `age, sex, cp, trestbps, chol, fbs, restecg_anormal, thalach, exang, oldpeak, slope` |
| Independientes. Añadidas en el modelo extendido (imagen) | `ca` (fluoroscopia), `thal` (gammagrafía con talio) |
| Potenciales confusoras | `age` y `sex`, que siempre se incluyen en los modelos ajustados. |
| No disponibles (limitación) | Tabaquismo, diabetes diagnosticada, IMC, antecedentes familiares, tratamiento previo con estatinas. |

## 8. Métodos de análisis · Rúbrica G

| Etapa | Método | Justificación |
|---|---|---|
| Normalidad | Shapiro-Wilk por grupo. | Decide entre una prueba paramétrica y una no paramétrica. Todas las continuas resultaron no normales en al menos un grupo. |
| Comparación de continuas | U de Mann-Whitney con correlación biserial por rangos (o t de Welch con d de Cohen si hay normalidad). | No requiere el supuesto de normalidad. |
| Comparación de cualitativas | Chi² de Pearson con V de Cramér. Exacta de Fisher o Monte Carlo si algún esperado es < 5. | Validez con frecuencias bajas (ST-T, n = 4). |
| Asociación | Regresión logística por máxima verosimilitud: OR crudos y ajustados con IC 95 % de Wald. OR por unidades clínicas (10 años, 10 mmHg, 40 mg/dL, 10 lpm, 1 mm, 1 vaso). | El desenlace es binario; el OR es interpretable. |
| Supuestos del modelo | Box-Tidwell (linealidad del logit), VIF (colinealidad), Hosmer-Lemeshow (bondad de ajuste), distancia de Cook (influencia). | Control de calidad del modelo explicativo. |
| Predicción | RL básica, RL extendida (L2, C = 1), CART (profundidad y tamaño de hoja elegidos por CV interna, es decir, CV anidada) y Random Forest como referencia de máxima flexibilidad. Réplica del modelo del semestre 1 como línea base. | Compara modelos interpretables contra uno flexible. |
| Validación interna | Validación cruzada estratificada 5 × 20 (100 particiones idénticas para todos los modelos). Bootstrap de optimismo de Harrell (500 réplicas). | Más estable que una única partición 80/20. |
| Discriminación | AUC: media y percentiles 2,5–97,5 en la CV; IC 95 % de DeLong sobre predicciones fuera de muestra. | |
| Calibración | Pendiente e intercepto de calibración, Brier, curva por deciles. | La exactitud no basta para un uso clínico. |
| Utilidad clínica | Sensibilidad, especificidad, VPP y VPN con umbral 0,5 y con el umbral que garantiza sensibilidad ≥ 90 % (escenario de tamizaje). | En diagnóstico, el falso negativo es el error más costoso. |
| Comparación de modelos | t corregido de Nadeau-Bengio sobre las 100 particiones pareadas; DeLong; razón de verosimilitud para modelos anidados. | Corrige la dependencia entre particiones. |

**Herramientas.** Python 3.12: pandas, NumPy, SciPy, statsmodels, scikit-learn y matplotlib (versiones fijadas en
`requirements.txt`). El análisis está en notebooks Jupyter numerados (`notebooks/01`–`05`), que se ejecutan en orden con `make all` (unos 4 minutos) y guardan sus salidas, usa la semilla 2026 y se versiona con Git y GitHub.

## 9. Gestión de datos y control de calidad · Rúbrica G

1. **Fuente oficial:** UCI (DOI 10.24432/C52P4X). La integridad se verifica con SHA-256 en cada ejecución.
2. **Auditoría de la versión Kaggle** usada en el semestre 1 (`data/raw/README.md`, `fig01`):
   - `target` invertido;
   - tres variables recodificadas;
   - faltantes ocultos como `ca = 4` y `thal = 0`;
   - un registro duplicado.
3. **Reglas de rango fisiológico:** 0 valores fuera de rango. **Códigos válidos:** 0 inválidos. **Duplicados en UCI:** 0.
4. **Faltantes:** 6 de 303 (2 %). Se manejan por casos completos, con análisis de sensibilidad (modelo básico, n = 303).
5. **Reproducibilidad:**
   - el código está separado de los datos;
   - la semilla es fija y las versiones están fijadas;
   - las tablas y figuras se regeneran desde el código y no se editan a mano;
   - `make verify` comprueba que una segunda ejecución produce resultados idénticos.

## 10. Limitaciones y estrategias de mitigación · Rúbrica G (protocolo)

| Limitación | Efecto esperado | Mitigación |
|---|---|---|
| Datos de 1980 en EE. UU.; población remitida a angiografía (sesgo de espectro). | El modelo no es generalizable a Colombia ni a atención primaria; la prevalencia es mayor que en la población general. | Se declara el alcance. Se propone validación externa (otras sedes UCI; datos colombianos) como trabajo futuro. |
| Tamaño de muestra inferior al recomendado por Riley. | Riesgo de sobreajuste. | Penalización L2, CV repetida, corrección por optimismo y reporte de la pendiente de calibración. |
| Predominio masculino (67,7 %). | Menor precisión en mujeres. | Se reporta el OR por sexo; el análisis estratificado queda como exploratorio. |
| Ausencia de tabaquismo, diabetes, IMC y estatinas. | Confusión residual (por ejemplo, el colesterol puede estar atenuado por las estatinas). | Se discute en la interpretación. |
| `ca` y `thal` se obtienen con estudios de imagen, no siempre disponibles. | El modelo extendido no es de bajo costo. | Se compara explícitamente con el modelo básico (H-3). |
| Diseño transversal. | No permite inferencia causal. | Se interpreta como asociación diagnóstica, no como un factor causal. |
| Validación solo interna. | Desempeño optimista frente a otros centros. | Se usa el AUC corregido por optimismo y se propone validación externa. |

## 11. Consideraciones éticas · Rúbrica G

- Los datos son **secundarios, públicos y anonimizados**: el donante reemplazó nombres y números de seguridad social por valores ficticios. La licencia es CC BY 4.0.
- Según la Resolución 8430 de 1993 del Ministerio de Salud de Colombia (art. 11), es una **investigación sin riesgo**: no hay intervención ni contacto con personas, y no se requiere consentimiento informado.
- Se cumple la Ley 1581 de 2012: no se procesan datos personales identificables.
- Se citan obligatoriamente los investigadores originales (ver `data/raw/README.md`).
- **El modelo es una herramienta académica y no reemplaza el juicio clínico.**

## 12. Cambios frente al semestre 1 (trazabilidad)

| Semestre 1 | Ahora | Motivo |
|---|---|---|
| Base de Kaggle | Base oficial de UCI | Etiquetas invertidas y faltantes ocultos en Kaggle. |
| «FC máxima alta = más riesgo» | FC máxima alta = **menor** riesgo (OR 0,82 por cada 10 lpm; significancia limítrofe, p = 0,048) | Consecuencia de la inversión de `target`. |
| 4 variables continuas; partición única 80/20 | Modelos básico y extendido; CV 5 × 20; bootstrap | El AUC de 4 variables cae a 0,75 con validación rigurosa. |
| Tabla de valores p de 12 variables con un modelo de 4 | Un modelo explicativo por conjunto de variables, con diagnósticos | Coherencia entre el modelo reportado y la tabla. |
| Regresión lineal sobre un desenlace binario | Se elimina | No corresponde al tipo de desenlace. |
| Sin H0/H1, sin cálculo de muestra, sin calibración | §3, §6 y §8 | Requisitos de la rúbrica y del protocolo. |

## 13. Pendiente para completar el protocolo · Rúbrica H e I

- [ ] Cronograma por actividades con responsables (Angie Tobar y Alejandro Pardo) y productos verificables.
- [ ] Instituciones: Universidad Externado (sede académica), UCI ML Repository (fuente) y Cleveland Clinic (origen de los datos).
- [ ] Presupuesto discriminado por rubros (personal en horas, cómputo, software libre, divulgación) y fuentes de financiación.
- [ ] Anexos: diccionario de variables (listo), código (listo), auditoría de datos (lista).
- [ ] Referencias en formato Vancouver, verificadas por DOI.
