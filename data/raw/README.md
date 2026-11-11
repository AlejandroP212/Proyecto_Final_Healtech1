# Datos crudos (no modificar)

| Archivo | Origen | Uso |
|---|---|---|
| `processed.cleveland.data` | UCI Machine Learning Repository, *Heart Disease*, subconjunto Cleveland. DOI [10.24432/C52P4X](https://doi.org/10.24432/C52P4X). Descargado de `https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data` el 2026-11-11. | **Fuente oficial del análisis.** |
| `heart-disease.names` | Mismo repositorio. | Documentación oficial: codificación de cada variable e investigadores responsables. |
| `heart_disease_kaggle.csv` | Versión redistribuida en Kaggle, usada en el semestre 1. | Solo para la auditoría de calidad (`fig01`). **No se usa en los modelos.** |

**Integridad:** el pipeline verifica antes de ejecutar que el SHA-256 de `processed.cleveland.data` sea
`a74b7efa387bc9d108d7d0115d831fe9b414b29ae7124f331b622b4efa0427c8`.

**Licencia y cita:** CC BY 4.0. Los autores piden citar a los investigadores principales: Robert Detrano, M.D., Ph.D.
(V.A. Medical Center, Long Beach y Cleveland Clinic Foundation), Andras Janosi, M.D. (Budapest), William Steinbrunn, M.D.
(Zúrich) y Matthias Pfisterer, M.D. (Basilea). Referencia principal: Detrano R, *et al.* Am J Cardiol. 1989;64(5):304-10.

## Hallazgos de la auditoría de la versión Kaggle

Las 303 filas de Kaggle se emparejaron con UCI por las variables cuya codificación no cambia
(`age, sex, trestbps, chol, fbs, thalach, oldpeak`). Resultados:

1. **`target` está invertido:** el 100 % de los registros con `target = 1` corresponden a `num = 0` (sin enfermedad) en UCI.
2. **`cp`, `restecg` y `slope` están recodificados.** Mapeo Kaggle → UCI: `cp` 0→4, 1→2, 2→3, 3→1; `restecg` 0→2, 1→0, 2→1; `slope` 0→3, 1→2, 2→1; `thal` 1→6, 2→3, 3→7.
3. **Los faltantes están ocultos como valores válidos:** `ca = 4` (5 registros) y `thal = 0` (2 registros) son en realidad datos faltantes.
4. **Hay un registro duplicado:** la versión Kaggle contiene 302 pacientes únicos de UCI más una fila repetida.

Por eso las conclusiones del semestre 1 sobre la dirección de los efectos (por ejemplo, que «una frecuencia cardíaca alta aumenta el riesgo») estaban invertidas.
