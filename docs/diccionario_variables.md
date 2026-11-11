# Diccionario de variables

> Archivo generado automáticamente por `notebooks/01_datos_y_auditoria.ipynb` desde `notebooks/00_configuracion.ipynb`. No editar a mano.

Fuente: UCI Heart Disease, subconjunto Cleveland (`processed.cleveland.data`), codificación oficial según `data/raw/heart-disease.names`.

| Variable | Nombre | Definición conceptual | Definición operacional | Unidad | Tipo | Escala | Rol | Grupo | Categorías / rango observado | Faltantes |
|---|---|---|---|---|---|---|---|---|---|---|
| `age` | Edad | Tiempo de vida del paciente. | Años cumplidos al momento del estudio. | años | cuantitativa continua | razón | independiente | clínica | 29 – 77 | 0 |
| `sex` | Sexo masculino | Sexo biológico. | 1 = hombre, 0 = mujer, según el registro clínico. |  | cualitativa dicotómica | nominal | independiente | clínica | 0 = Mujer; 1 = Hombre | 0 |
| `cp` | Tipo de dolor torácico | Caracterización clínica del dolor torácico según su relación con el esfuerzo y su respuesta a nitratos. | Clasificación del médico tratante: típica (cumple 3 criterios), atípica (2), no anginoso (≤ 1), asintomático. |  | cualitativa politómica | nominal | independiente | clínica | 1 = Angina típica; 2 = Angina atípica; 3 = Dolor no anginoso; 4 = Asintomático | 0 |
| `trestbps` | Presión arterial sistólica en reposo | Presión que ejerce la sangre sobre las arterias durante la sístole, en reposo. | Presión sistólica en mmHg medida al ingreso hospitalario. | mmHg | cuantitativa continua | razón | independiente | clínica | 94 – 200 | 0 |
| `chol` | Colesterol sérico total | Concentración de colesterol total en el suero. | mg/dL en sangre periférica. | mg/dL | cuantitativa continua | razón | independiente | laboratorio | 126 – 564 | 0 |
| `fbs` | Glucemia en ayunas > 120 mg/dL | Hiperglucemia en ayunas, marcador de alteración del metabolismo de la glucosa. | 1 si la glucemia en ayunas es > 120 mg/dL; 0 en caso contrario. |  | cualitativa dicotómica | nominal | independiente | laboratorio | 0 = No; 1 = Sí | 0 |
| `restecg` | ECG en reposo | Hallazgos del electrocardiograma de 12 derivaciones en reposo. | 0 normal; 1 anomalía ST-T (inversión de T o elevación/depresión del ST > 0,05 mV); 2 hipertrofia ventricular izquierda probable o definitiva (criterios de Estes). |  | cualitativa politómica | nominal | independiente | ECG reposo | 0 = Normal; 1 = Anomalía ST-T; 2 = Hipertrofia VI | 0 |
| `restecg_anormal` | ECG en reposo anormal (ST-T o HVI) | ECG de reposo con cualquier anormalidad. | 1 si restecg ∈ {1, 2}; 0 si es normal. |  | cualitativa dicotómica (derivada) | nominal | independiente | ECG reposo | 0 = No; 1 = Sí | 0 |
| `thalach` | Frecuencia cardíaca máxima alcanzada | Respuesta cronotrópica al ejercicio. | Frecuencia cardíaca máxima (lpm) alcanzada en la prueba de esfuerzo. | lpm | cuantitativa continua | razón | independiente | prueba de esfuerzo | 71 – 202 | 0 |
| `exang` | Angina inducida por ejercicio | Isquemia miocárdica sintomática provocada por el esfuerzo. | 1 si hubo angina durante la prueba de esfuerzo; 0 si no. |  | cualitativa dicotómica | nominal | independiente | prueba de esfuerzo | 0 = No; 1 = Sí | 0 |
| `oldpeak` | Depresión del ST inducida por ejercicio | Isquemia miocárdica electrocardiográfica provocada por el esfuerzo. | Depresión del segmento ST (mm) inducida por ejercicio, relativa al reposo. | mm | cuantitativa continua | razón | independiente | prueba de esfuerzo | 0 – 6.2 | 0 |
| `slope` | Pendiente del ST en el pico de ejercicio | Morfología del segmento ST en el pico del ejercicio. | 1 ascendente, 2 plana, 3 descendente. |  | cualitativa politómica | ordinal | independiente | prueba de esfuerzo | 1 = Ascendente; 2 = Plana; 3 = Descendente | 0 |
| `ca` | Vasos mayores coloreados por fluoroscopia | Calcificación de arterias coronarias principales, marcador de aterosclerosis. | Número de vasos mayores (0–3) coloreados en la fluoroscopia. | n.º (0-3) | cuantitativa discreta | razón | independiente | imagen | 0 – 3 | 4 |
| `thal` | Gammagrafía con talio | Perfusión miocárdica evaluada con gammagrafía con talio-201. | 3 normal; 6 defecto fijo (cicatriz); 7 defecto reversible (isquemia inducible). |  | cualitativa politómica | nominal | independiente | imagen | 3 = Normal; 6 = Defecto fijo; 7 = Defecto reversible | 2 |
| `ec` | Enfermedad coronaria angiográfica (estenosis > 50 %) | Enfermedad coronaria aterosclerótica significativa. | Estenosis > 50 % del diámetro en al menos un vaso mayor en la angiografía coronaria (num ≥ 1). |  | cualitativa dicotómica | nominal | dependiente (desenlace) | desenlace | 0 = Sin EC; 1 = Con EC | 0 |

Notas:

- `ec` se deriva de `num` (0 = estenosis < 50 %; 1–4 = estenosis > 50 % en al menos un vaso mayor).
- `restecg_anormal` agrupa anomalía ST-T (n = 4) e hipertrofia ventricular izquierda para estabilizar la estimación en los modelos; la Tabla 1 conserva las tres categorías.
- Categorías de referencia en los OR: `cp` = Angina típica, `restecg` = Normal, `slope` = Ascendente, `thal` = Normal.
- OR de continuas expresados por: `age` 10 años, `trestbps` 10 mmHg, `chol` 40 mg/dL, `thalach` 10 lpm, `oldpeak` 1 mm, `ca` 1 n.º (0-3).
