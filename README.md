# Predicción de Enfermedades Cardíacas - Healtech 1

Este repositorio contiene los archivos y el código del proyecto final de **Healtech 1**, enfocado en el Análisis Estadístico y Modelado Predictivo para la detección temprana de enfermedades cardíacas.

## 👥 Integrantes del Equipo
* Santiago Palacios
* Angie Tobar
* Alejandro Pardo

## 📊 Sobre el Proyecto

El objetivo principal del estudio es desarrollar un modelo capaz de distinguir entre pacientes sanos y aquellos con presencia de enfermedad cardíaca, basándose en variables demográficas y pruebas de esfuerzo. Para ello, utilizamos el estándar de oro en machine learning médico: el dataset **"Heart Disease"** de la Fundación Clínica Cleveland.

El dataset cuenta con 303 pacientes y 14 variables clínicas, y tras la limpieza de datos se trabajó con 0 valores nulos, contando con una distribución balanceada de la variable objetivo (54.5% enfermos y 45.5% sanos).

### Modelos Desarrollados:
1. **Regresión Lineal Múltiple (Baseline):** Un primer acercamiento ajustado mediante OLS. Ayudó a identificar pesos de variables (como la frecuencia cardíaca máxima), pero resultó conceptualmente insuficiente para clasificación binaria ($R^2 \approx 0.30$).
2. **Regresión Logística:** El modelo principal y definitivo. Utiliza el solver 'LBFGS' y regularización L2 (Ridge) para transformar las variables clínicas en probabilidades reales (Log-Odds y Sigmoide). 
   * **Desempeño:**
     * Exactitud General: 77.1%
     * **Sensibilidad (Recall): 78.1%** (Métrica clínica prioritaria para minimizar Falsos Negativos).
     * Área Bajo la Curva (AUC): 0.838.

## 📂 Estructura del Repositorio

El proyecto contiene los siguientes archivos principales:

* **`Predicción_de_Enfermedades_Cardíacas.ipynb`**: Es el núcleo técnico del proyecto. Este Jupyter Notebook contiene todo el código en Python: carga de datos, Análisis Exploratorio de Datos (EDA) con visualizaciones detalladas, limpieza, entrenamiento de los modelos (Regresión Lineal y Logística) y evaluación de métricas (Matriz de Confusión, Curva ROC).
* **`heart_disease.csv`**: El dataset oficial utilizado para el entrenamiento y prueba del modelo, que contiene las variables demográficas, clínicas e indicadores de los 303 pacientes.
* **`Guion_Presentacion_Healtech.md` / `Guion_Presentacion_Heart_Disease.docx`**: Contienen el guion oficial estructurado que se utilizó para la presentación final del proyecto, dividido por integrantes y con las explicaciones clínicas de cada diapositiva.
* **`presentacion_healtech.html`**: Presentación exportada en formato web (HTML) con las diapositivas y hallazgos mostrados a la audiencia.
* **Carpetas Ocultas (`.venv`, `.vscode`)**: Configuraciones locales del entorno virtual de Python y del editor de código Visual Studio Code.

## 🚀 Próximos Pasos (Hacia Healtech 2)
Esta documentación y repositorio sientan las bases para la posterior redacción de un artículo (paper) investigativo sobre nuestros hallazgos clínicos y predictivos. Como trabajo futuro, se planea reducir la tasa de error utilizando métodos de ensamble más complejos como Bosques Aleatorios (*Random Forests*).
