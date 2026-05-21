# Prediccion de Enfermedades Cardiacas - Healtech 1

Proyecto final de **Healtech 1** orientado al analisis estadistico y al modelado predictivo para apoyar la deteccion temprana de enfermedad cardiaca a partir de variables clinicas.

El repositorio integra el dataset trabajado, el notebook de analisis, la presentacion final y los guiones usados para comunicar los hallazgos. Tambien queda preparado como base para una futura redaccion en formato de paper investigativo.

## Equipo

- Santiago Palacios
- Angie Tobar
- Alejandro Pardo

## Objetivo

Construir y evaluar modelos predictivos capaces de clasificar pacientes como sanos o con presencia de enfermedad cardiaca usando informacion clinica estructurada. El proyecto compara un primer enfoque de **regresion lineal** como linea base con un modelo de **regresion logistica**, mas adecuado para una variable objetivo binaria.

## Dataset

El archivo [`heart_disease.csv`](heart_disease.csv) contiene 303 registros de pacientes y 14 variables clinicas. La variable objetivo es `target`:

- `0`: ausencia de enfermedad cardiaca.
- `1`: presencia de enfermedad cardiaca.

Resumen del dataset usado en el notebook:

- Filas: 303 pacientes.
- Columnas: 14 variables.
- Valores nulos: 0.
- Distribucion de `target`: 138 pacientes sanos (45.54%) y 165 pacientes con enfermedad (54.46%).

### Diccionario de variables

| Variable | Descripcion |
| --- | --- |
| `age` | Edad del paciente. |
| `sex` | Sexo codificado numericamente. |
| `cp` | Tipo de dolor de pecho. |
| `trestbps` | Presion arterial en reposo. |
| `chol` | Colesterol serico. |
| `fbs` | Azucar en sangre en ayunas mayor a 120 mg/dl. |
| `restecg` | Resultados electrocardiograficos en reposo. |
| `thalach` | Frecuencia cardiaca maxima alcanzada. |
| `exang` | Angina inducida por ejercicio. |
| `oldpeak` | Depresion del segmento ST inducida por ejercicio. |
| `slope` | Pendiente del segmento ST en ejercicio. |
| `ca` | Numero de vasos principales observados por fluoroscopia. |
| `thal` | Resultado de prueba thalassemia codificado. |
| `target` | Diagnostico binario de enfermedad cardiaca. |

## Metodologia

El flujo tecnico principal esta implementado en [`Predicción_de_Enfermedades_Cardíacas.ipynb`](Predicción_de_Enfermedades_Cardíacas.ipynb):

1. Carga del dataset desde `heart_disease.csv`.
2. Revision de estructura, tipos de datos y valores nulos.
3. Analisis exploratorio visual de la variable objetivo y predictores clinicos.
4. Revision de distribuciones, correlaciones y relaciones entre variables.
5. Seleccion inicial de variables continuas: `age`, `chol`, `thalach` y `trestbps`.
6. Division de datos en entrenamiento y prueba con proporcion 80/20 (`random_state=42`).
7. Entrenamiento de una regresion lineal como baseline.
8. Entrenamiento de una regresion logistica como clasificador formal.
9. Evaluacion con metricas de clasificacion, matriz de confusion y curva ROC.

## Resultados principales

### Regresion lineal

La regresion lineal se uso como modelo exploratorio inicial. Aunque ayuda a entender relaciones aproximadas entre variables, no es el enfoque ideal para un diagnostico binario porque puede producir valores continuos fuera de una interpretacion estricta de clase.

Resultados observados:

- `R2`: 0.3002.
- `MSE`: 0.1745.

### Regresion logistica

La regresion logistica se usa como modelo principal porque transforma la combinacion lineal de variables en una probabilidad acotada entre 0 y 1 mediante la funcion sigmoide. Esto la hace metodologicamente mas apropiada para clasificacion binaria.

Resultados sobre el conjunto de prueba:

- Accuracy: 77.05%.
- Precision: 78.12%.
- Recall / sensibilidad: 78.12%.
- F1-score: 78.12%.
- AUC ROC: 0.8384.
- Matriz de confusion: `[[22, 7], [7, 25]]`.

En contexto clinico, la sensibilidad es especialmente importante porque los falsos negativos representan pacientes con enfermedad que el modelo clasificaria como sanos. En esta ejecucion hubo 7 falsos negativos en el conjunto de prueba.

## Estructura del repositorio

| Archivo o carpeta | Proposito |
| --- | --- |
| [`Predicción_de_Enfermedades_Cardíacas.ipynb`](Predicción_de_Enfermedades_Cardíacas.ipynb) | Notebook principal con EDA, preprocesamiento, entrenamiento y evaluacion de modelos. |
| [`heart_disease.csv`](heart_disease.csv) | Dataset clinico usado para el analisis y modelado. |
| [`presentacion_healtech.html`](presentacion_healtech.html) | Presentacion web en formato Reveal.js con los hallazgos finales del proyecto. |
| [`Guion_Presentacion_Healtech.md`](Guion_Presentacion_Healtech.md) | Guion final de exposicion, alineado con la narrativa de regresion logistica y evaluacion clinica. |
| [`Guion_Presentacion_Heart_Disease.docx`](Guion_Presentacion_Heart_Disease.docx) | Guion en Word de una version previa centrada en regresion lineal. Se conserva como evidencia del proceso iterativo. |
| [`requirements.txt`](requirements.txt) | Dependencias principales para ejecutar el notebook. |
| [`.gitignore`](.gitignore) | Reglas para excluir entorno virtual, caches y archivos locales del repositorio. |
| [`.vscode/settings.json`](.vscode/settings.json) | Configuracion local del interprete de VS Code. No es necesaria para reproducir el proyecto. |

La carpeta `.venv/` corresponde al entorno virtual local y no debe subirse al repositorio.

## Requisitos

El proyecto fue trabajado con Python 3.12. Para reproducirlo se recomienda crear un entorno virtual e instalar las dependencias:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Como ejecutar el proyecto

1. Clonar el repositorio:

```bash
git clone https://github.com/AlejandroP212/Proyecto_Final_Healtech1.git
cd Proyecto_Final_Healtech1
```

2. Crear y activar el entorno virtual:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

3. Instalar dependencias:

```bash
pip install -r requirements.txt
```

4. Abrir el notebook:

```bash
jupyter notebook "Predicción_de_Enfermedades_Cardíacas.ipynb"
```

5. Ejecutar las celdas en orden para reproducir el analisis y las metricas.

## Presentacion

La presentacion puede abrirse directamente en un navegador desde [`presentacion_healtech.html`](presentacion_healtech.html). Usa Reveal.js, Chart.js y Font Awesome desde CDN, por lo que algunas visualizaciones o estilos dependen de conexion a internet.

## Notas para el futuro paper

Este repositorio ya contiene los elementos base para redactar un documento investigativo:

- Planteamiento del problema: deteccion temprana de enfermedad cardiaca.
- Descripcion del dataset y sus variables.
- Exploracion estadistica inicial.
- Justificacion metodologica del cambio de regresion lineal a regresion logistica.
- Evaluacion del clasificador con metricas clinicamente interpretables.
- Discusion sobre falsos negativos, sensibilidad y trabajo futuro.

Lineas recomendadas para una siguiente fase:

- Comparar la regresion logistica contra Random Forest, Gradient Boosting y SVM.
- Evaluar validacion cruzada para reducir dependencia de una unica particion train/test.
- Probar escalamiento de variables y seleccion de caracteristicas.
- Reportar intervalos de confianza o estabilidad de metricas.
- Enfocar la discusion clinica en sensibilidad, especificidad y costo de falsos negativos.

## Estado del repositorio

Repositorio remoto objetivo:

```text
https://github.com/AlejandroP212/Proyecto_Final_Healtech1
```

Este README documenta el estado actual del proyecto y deja el repositorio listo para versionamiento en GitHub.
