# Angie: lee esto primero 👋

Hola, Angie. Este documento resume **qué cambió en el proyecto, qué ya está hecho y qué te toca a ti** para la entrega y la
exposición de mañana. Lo puedes leer completo en unos 10 minutos. Todo se puede abrir desde el navegador, sin instalar nada:
**https://github.com/AlejandroP212/Proyecto_Final_Healtech1**

---

## 1. En resumen

- ✅ **El análisis está terminado, verificado y en GitHub.**
- ✅ **El paper final está compilado:** [`paper/Paper_Healtech_Final.pdf`](paper/Paper_Healtech_Final.pdf).
- 🎯 **Tu tarea: armar la presentación** siguiendo [`presentacion/GUIA_PRESENTACION.md`](presentacion/GUIA_PRESENTACION.md).
  Ahí está todo: qué va en cada diapositiva, qué figura usar, el guion, los tiempos y las preguntas probables.

---

## 2. Lo que cambió desde las presentaciones anteriores (y por qué)

Es importante que lo entiendas bien, porque **seguramente nos lo van a preguntar**.

### El hallazgo más importante: la base de Kaggle estaba al revés

El archivo `heart_disease.csv` que usamos todo el semestre (versión de Kaggle) tiene la columna `target` **invertida**: donde dice
1 («enfermo»), en la base oficial de UCI el paciente estaba **sano**, y viceversa. Lo comprobamos comparando los 303 pacientes uno
por uno con la base oficial. Además, tenía:
- 3 variables con los códigos cambiados de orden;
- datos faltantes escondidos como si fueran valores válidos;
- un paciente duplicado.

**Consecuencia:** algunas conclusiones anteriores estaban al revés.

| Antes (con Kaggle) | Ahora (base oficial) |
|---|---|
| «Una FC máxima > 162 lpm es el mayor factor de riesgo (OR 9,17)» | Una FC **alta es protectora**. El riesgo está en no alcanzar la FC esperada: FC ≤ 162, OR 4,67; FC < 85 % de la esperada, OR 4,88 |
| AUC 0,838 con 4 variables | Con una validación más rigurosa, ese modelo da 0,749. El modelo nuevo da **0,874** |

**Esto no es un error nuestro que haya que esconder: es nuestro mejor punto de control de calidad.** En la exposición se presenta como «detectamos y corregimos un error en una base pública muy usada».

👉 La figura que lo muestra es `results/figures/fig01_auditoria_kaggle_vs_uci.png`: con la etiqueta de Kaggle, los «enfermos» tenían
la frecuencia más alta, lo cual es fisiológicamente absurdo (un corazón enfermo tolera **menos** el esfuerzo).

### Lo que se mantiene de nuestro trabajo del semestre

- La base de Cleveland, el problema, la justificación (detectar el riesgo con variables de bajo costo antes de la angiografía) y los costos.
- El objetivo general y los objetivos específicos, con la misma idea y la misma secuencia.
- La regresión logística, los árboles de decisión, los **OR por rangos** del Taller 2 y la **regresión lineal** de la presión arterial con Shapiro-Wilk y Breusch-Pagan, ahora como paso preliminar.
- La comparación con el artículo de Chandrasekhar y Peddakrishna (2023).

### Lo que se agregó (lo exige la rúbrica de la profesora)

- **Hipótesis H0/H1:** nuestra hipótesis general se prueba con 4 pruebas formales, y en las 4 rechazamos H0.
- **Población y muestra:** universo, población, criterios de inclusión y exclusión, muestreo y **cálculo del tamaño de muestra**.
- **Variables:** definición de cada una y clasificación en factores de riesgo, marcadores clínicos e imagen.
- **Rigor metodológico:** control de calidad, limitaciones, ética, cronograma y presupuesto.
- **Validación más rigurosa:** en vez de una sola partición 80/20, se usaron 100 evaluaciones, más calibración.
- **Comparación de modelos:** dos regresiones logísticas (con y sin exámenes de imagen) y un Random Forest de referencia.

### El título

El paper quedó con este título, que conserva la idea del nuestro y le agrega la población y el método (la rúbrica los pide):

> **Factores de riesgo cardiovascular y predicción de enfermedad coronaria: un enfoque de ciencia de datos con regresión
> logística y árboles de decisión en pacientes remitidos a angiografía**

**Usa exactamente este título en la presentación**, para que coincida con el paper.

¿Por qué «enfermedad **coronaria**» y no «cardíaca»? Porque la documentación oficial de la base define el diagnóstico como
«estrechamiento > 50 % del diámetro de una arteria coronaria mayor, visto en angiografía». Es específicamente enfermedad coronaria.

---

## 3. Qué tienes que hacer (paso a paso)

| # | Tarea | Tiempo aprox. |
|---|---|---|
| 1 | Leer este documento | 10 min |
| 2 | Leer la [guía de la presentación](presentacion/GUIA_PRESENTACION.md) completa | 20 min |
| 3 | Hojear el [paper en PDF](paper/Paper_Healtech_Final.pdf) para ver el panorama completo | 15 min |
| 4 | **Armar las diapositivas** con la estructura de la guía (28 diapositivas). Puedes partir de nuestra presentación anterior (`archivo/semestre_2_presentaciones_previas/Presentacion_Estructura_Tablero.html`) para mantener el mismo diseño, o hacerla en PowerPoint o Canva | 2–3 h |
| 5 | Insertar las figuras de `results/figures/` (en GitHub: abrir el PNG → *Download*) | incluido en el 4 |
| 6 | Revisar que **no aparezca ninguna cifra vieja** (ver el cuadro ⚠️ al inicio de la guía) | 10 min |
| 7 | **Ensayar juntos con cronómetro**: la meta es 35–40 min | 1 h |
| 8 | Repasar las **preguntas probables** de la guía; cada uno debe poder responderlas | 20 min |

**Reparto propuesto** (ajústenlo si prefieren otro):
- **Tú:** contexto, enfermedad, problema, justificación, antecedentes, objetivos, cohorte, OR por rangos, árbol, discusión, limitaciones y conclusiones.
- **Alejandro:** hipótesis, población y muestra, variables, control de calidad (Kaggle), métodos, validación y resultados de los modelos.

---

## 4. Los 6 conceptos que tienes que dominar

Si entiendes estos 6, puedes defender todo el proyecto.

| Concepto | Explicación corta |
|---|---|
| **OR (odds ratio)** | Cuántas veces más odds de enfermedad tiene un grupo frente a otro. OR = 1: no hay asociación; OR > 1: riesgo; OR < 1: protección. Es significativo si su IC 95 % **no incluye el 1**. *Ejemplo: depresión del ST ≥ 1 mm, OR 5,06 (3,08–8,29): cinco veces más odds.* |
| **OR crudo frente a ajustado** | El crudo mira una variable sola; el ajustado (regresión logística) la mira controlando todas las demás a la vez. *La edad: OR crudo 3,4, pero ajustada no es significativa, porque su efecto lo explican el sexo y la prueba de esfuerzo.* |
| **H0 / H1** | H0 = «no pasa nada»; H1 = lo que queremos demostrar. Si p < 0,05, rechazamos H0. Tenemos 4 pares (H-1 a H-4) y rechazamos H0 en los cuatro. |
| **AUC** | La probabilidad de que el modelo le dé más riesgo a un enfermo que a un sano tomados al azar. 0,5 = azar; 1 = perfecto; > 0,8 = clínicamente útil. *El nuestro: 0,874.* |
| **Validación cruzada** | Dividimos a los pacientes en 5 grupos: entrenamos con 4 y probamos con el quinto, rotando, y lo repetimos 20 veces. Son 100 evaluaciones con pacientes que el modelo **no vio**. *Es como no dejar que el estudiante vea el examen antes.* |
| **Calibración** | Si el modelo dice «30 % de riesgo», ¿de verdad se enferman unos 30 de cada 100? Lo ideal es una pendiente de 1; la nuestra es 0,91. |

Y dos preguntas que casi seguro aparecen:
- **«¿Por qué no es significativo el colesterol?»** → Daña durante décadas, mientras que la prueba de esfuerzo muestra la enfermedad
  ya instaurada. Además, todos estos pacientes ya eran de alto riesgo, y no sabemos quién tomaba estatinas. Eso no significa que no importe en la prevención.
- **«¿Por qué ganó la regresión logística y no el árbol o el Random Forest?»** → El árbol se sobreajusta y es inestable. El Random
  Forest empató (0,910 frente a 0,909), pero está peor calibrado y no es interpretable. Con 297 pacientes, el modelo simple es suficiente.

---

## 5. Si quieres profundizar

| Si necesitas… | Abre |
|---|---|
| Cualquier cifra, tabla o explicación detallada | [`docs/documento_proyecto.md`](docs/documento_proyecto.md) (el documento maestro) |
| Saber en qué parte está cada criterio de la rúbrica | Anexo D de ese mismo documento |
| Ver el código y los resultados paso a paso | [`notebooks/`](notebooks) (GitHub los muestra con gráficos incluidos) |
| La definición de cada variable | [`docs/diccionario_variables.md`](docs/diccionario_variables.md) |
| La rúbrica con la que nos califican | [`docs/lineamientos/Rubrica_evaluacion_pares.docx`](docs/lineamientos/Rubrica_evaluacion_pares.docx) |

---

## 6. Lista final antes de exponer

- [ ] El título de la presentación es igual al del paper
- [ ] Ninguna cifra vieja (OR 9,17; AUC 0,838; «FC alta = riesgo»; «enfermedad cardíaca»)
- [ ] Están las diapositivas de hipótesis (H0/H1), muestra, control de calidad, limitaciones, ética, cronograma y presupuesto (las pide la rúbrica)
- [ ] Las figuras se ven bien en el proyector (una idea por diapositiva y poco texto)
- [ ] Ensayamos con cronómetro: 35–40 min
- [ ] Cada expositor sabe responder las preguntas de la guía

¡Éxitos mañana! 💪
