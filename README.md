# Factores de riesgo cardiovascular y predicción de enfermedad coronaria

**Un enfoque de ciencia de datos con regresión logística y árboles de decisión en pacientes remitidos a angiografía**

**HealthTech 1 y 2 · Pregrado en Ciencia de Datos aplicada a la Salud · Universidad Externado de Colombia**
Angie Milena Tobar Aguirre · Alejandro Pardo Costo · Docente: Eliana Andrea González Artunduaga

Estudio observacional analítico de corte transversal con datos secundarios: 303 pacientes remitidos a angiografía coronaria en la
Cleveland Clinic Foundation (UCI *Heart Disease*). Responde dos preguntas:
- ¿Qué factores de riesgo cardiovascular y hallazgos clínicos de consulta, ECG y prueba de esfuerzo se asocian de forma independiente con la enfermedad coronaria?
- ¿Qué tan bien la predicen la regresión logística, un árbol de decisión y un Random Forest, con y sin estudios de imagen?

> 📄 **Documento completo del proyecto:** **[`docs/documento_proyecto.md`](docs/documento_proyecto.md)**. Incluye título, resumen, problema,
> vacío, justificación, objetivos, hipótesis H0/H1, población y muestra, variables, **algoritmos con sus parámetros**, control de
> calidad, ética, resultados, discusión, conclusiones, cronograma, presupuesto, referencias Vancouver y la correspondencia con la rúbrica.
> Cifras actualizadas: [`results/RESUMEN_RESULTADOS.md`](results/RESUMEN_RESULTADOS.md).
>
> 📑 **Paper final:** [`paper/main.tex`](paper/main.tex) · 🎤 **Guía de la exposición:** [`presentacion/GUIA_PRESENTACION.md`](presentacion/GUIA_PRESENTACION.md)

## Métodos en una línea

| Etapa | Técnicas |
|---|---|
| Datos | Base oficial UCI Cleveland (SHA-256), depuración, control de calidad, auditoría de la versión Kaggle |
| Descriptivo | Shapiro-Wilk → U de Mann-Whitney / t de Welch; chi² / Fisher / Monte Carlo; IC de Wilson; Spearman |
| Paso preliminar | Modelo lineal de probabilidad y regresión lineal de la presión arterial (Shapiro-Wilk, Breusch-Pagan): justifican la regresión logística |
| Asociación | OR por rangos clínicos (tablas 2 × 2, IC de Woolf); regresión logística por máxima verosimilitud: OR crudos y ajustados; Box-Tidwell, VIF, Hosmer-Lemeshow, Cook; tamaño de muestra de Riley (2020) |
| Predicción | RL con L2 (básica, 11 variables no invasivas; extendida, 13), árbol CART con validación cruzada anidada, Random Forest (300 árboles) |
| Validación | Validación cruzada estratificada 5 × 20, bootstrap de optimismo (500), AUC con IC de DeLong, calibración, umbral de sensibilidad del 90 %, t de Nadeau-Bengio |

## Hallazgos principales

| | RL 4 continuas (semestre 1) | **RL básica (no invasiva)** | RL extendida (+ imagen) | Árbol CART | Random Forest |
|---|---|---|---|---|---|
| AUC, validación cruzada 5 × 20 | 0,749 | **0,874** | 0,909 | 0,842 | 0,910 |
| Pendiente de calibración | 0,93 | **0,91** | 0,84 | 0,26 | 1,59 |

1. **Las variables no invasivas discriminan bien:** el AUC corregido por optimismo es 0,880. Los predictores independientes son el dolor torácico asintomático (OR 10,6), el sexo masculino (OR 7,5) y la depresión del ST (OR 1,8 por mm). La frecuencia cardíaca máxima es **protectora** (OR 0,82 por cada 10 lpm), aunque su significancia es limítrofe (p = 0,048; p = 0,051 con n = 303). El colesterol no se asocia de forma independiente.
2. **La imagen aporta, pero poco:** la fluoroscopia y la gammagrafía con talio suben el AUC en 0,035 (IC 95 % 0,008–0,062).
3. **La regresión logística supera al árbol de decisión** (ΔAUC 0,067; p = 0,004) e iguala al Random Forest, con mejor calibración.
4. **La base de Kaggle usada en el semestre 1 tiene la etiqueta invertida.** Al corregirlo se invierte la dirección de varios efectos ([`data/raw/README.md`](data/raw/README.md)).

## Estructura

```text
├── data/
│   ├── raw/                 # Datos originales (no se modifican) + procedencia y auditoría
│   └── processed/           # Base depurada (generada)
├── notebooks/               # Análisis completo, ejecutable en orden (salidas guardadas)
│   ├── 00_configuracion.ipynb      # rutas, semilla, diccionario de variables, predictores, paleta, utilidades
│   ├── 01_datos_y_auditoria.ipynb  # SHA-256, depuración, control de calidad, auditoría Kaggle vs. UCI
│   ├── 02_descriptivo.ipynb        # Tabla 1 (Shapiro-Wilk → prueba adecuada), figuras 3–5
│   ├── 03_asociacion.ipynb         # paso preliminar (regresión lineal), OR crudos/ajustados, supuestos, H-1, tamaño de muestra (Riley)
│   ├── 04_modelos_predictivos.ipynb# CV 5×20, bootstrap, DeLong, Nadeau-Bengio, calibración, H-2 a H-4
│   └── 05_resumen_resultados.ipynb # integra results/resultados.json y RESUMEN_RESULTADOS.md
├── results/
│   ├── figures/             # fig01–fig13 (PNG, 300 dpi)
│   ├── tables/              # tabla1–tabla4 y tabla2b (CSV + LaTeX) y detalle de OR
│   ├── json/                # resultados parciales de cada notebook
│   ├── resultados.json      # todas las cifras, en formato legible por máquina
│   └── RESUMEN_RESULTADOS.md
├── docs/
│   ├── documento_proyecto.md     # documento maestro (protocolo + resultados): base del paper
│   ├── diccionario_variables.md  # generado automáticamente
│   └── lineamientos/        # rúbrica de evaluación y guía de protocolo del curso
├── paper/                   # paper final en LaTeX (main.tex + plantilla + Figuras/): subir la carpeta tal cual a Overleaf
├── presentacion/            # GUIA_PRESENTACION.md: estructura, guion, cifras clave y preguntas para la exposición
├── archivo/semestre_2_presentaciones_previas/  # presentaciones de avance del semestre 2 (base de diseño)
└── Makefile                 # setup · all · verify · clean
```

## Cómo reproducir

```bash
git clone https://github.com/AlejandroP212/Proyecto_Final_Healtech1.git
cd Proyecto_Final_Healtech1
make setup      # (re)crea .venv desde cero e instala las versiones exactas de requirements.txt
make all        # unos 4 minutos: ejecuta los notebooks 01–05 en orden y regenera results/ y docs/diccionario_variables.md
make verify     # opcional: vuelve a ejecutar y comprueba que los resultados sean idénticos
```

Sin `make`: abrir los notebooks en Jupyter (`jupyter lab notebooks/`) y ejecutarlos en orden, del 01 al 05. Cada uno carga `00_configuracion.ipynb` con `%run`.

Requisitos: Python 3.12 y `make`. El Makefile antepone `.venv/bin` al `PATH`, de modo que el kernel de Jupyter usa siempre el
entorno del proyecto y no el Python del sistema.

**Reproducibilidad verificada.** `make verify` se ejecutó tras recrear el entorno desde cero y produjo un `resultados.json` idéntico.

Reglas del proyecto:
- Ninguna tabla, figura o cifra se edita a mano. Si algo cambia, se cambia el código y se vuelve a ejecutar.
- La semilla está fijada (2026) y el archivo crudo se verifica por SHA-256.

## Figuras

| # | Contenido | # | Contenido |
|---|---|---|---|
| 01 | Auditoría Kaggle vs. UCI (inversión de etiqueta) | 07 | Curvas ROC fuera de muestra |
| 02 | Diagrama de flujo de la muestra | 08 | Calibración |
| 03 | Variables cuantitativas por diagnóstico | 09 | Árbol de decisión final |
| 04 | Proporción de EC por variable cualitativa | 10 | Distribución del AUC en 100 particiones |
| 05 | Correlaciones de Spearman | 11 | Compromiso sensibilidad–especificidad |
| 06 | Forest plot de OR crudos y ajustados | 12 | Paso preliminar: la regresión lineal no cumple los supuestos |
| | | 13 | OR por rangos clínicos (Taller 2, corregido) |

## Historial

- **Semestre 1 (HealthTech 1):** análisis con la versión de Kaggle de la base (regresión lineal y logística con 4 variables). Ese material se
  retiró del árbol de trabajo porque sus conclusiones dependen de la etiqueta invertida. Sigue disponible en el historial de git
  (commit `f68b048`). Los cambios metodológicos están documentados en `docs/documento_proyecto.md`, Anexo E.
- **Semestre 2 (HealthTech 2):** reanálisis completo con la base oficial de UCI, el protocolo de investigación y validación interna rigurosa.

## Datos y citación

UCI Machine Learning Repository, *Heart Disease* (Cleveland). DOI [10.24432/C52P4X](https://doi.org/10.24432/C52P4X). Licencia CC BY 4.0.
Investigador principal en Cleveland: Robert Detrano, M.D., Ph.D. Detrano R, *et al.* Am J Cardiol. 1989;64(5):304-10.

*Proyecto académico. El modelo no está validado externamente y no debe usarse para decisiones clínicas.*
