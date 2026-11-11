# Resumen de resultados

> Generado automáticamente por `make all`. No editar a mano: toda cifra del paper y de la presentación debe salir de aquí o de `resultados.json`.

## Datos

- Fuente: UCI Machine Learning Repository, Heart Disease (Cleveland), DOI 10.24432/C52P4X. SHA-256 verificado.
- 303 registros; 6 con faltantes (ca: 4, thal: 2); muestra analítica n = 297, con 137 eventos (46,1 %).
- Auditoría Kaggle: target invertido = True; duplicados = 1; faltantes ocultos = {'ca==4': 5, 'thal==0': 2}.

## Asociación (OE2, H-1)

- Modelo básico: LR χ² = 174,7, gl = 14, p < 0,001 → **se rechaza H0 de H-1**. R² de Nagelkerke = 0,594; Hosmer-Lemeshow p = 0,532; VIF máximo = 4,19; Box-Tidwell p mínimo = 0,224.
- Variables significativas en el modelo básico: Sexo masculino; Tipo de dolor torácico: Asintomático (vs. angina típica); Frecuencia cardíaca máxima alcanzada (por 10 lpm); Depresión del ST inducida por ejercicio (por 1 mm).
- Variables significativas en el modelo extendido: Sexo masculino; Tipo de dolor torácico: Asintomático (vs. angina típica); Presión arterial sistólica en reposo (por 10 mmHg); Pendiente del ST en el pico de ejercicio: Plana (vs. ascendente); Vasos mayores coloreados por fluoroscopia (por cada vaso); Gammagrafía con talio: Defecto reversible (vs. normal).
- Dolor asintomático (básico): OR 10,60 (IC 95 % 3,17–35,40; p < 0,001). Sexo masculino: OR 7,48 (IC 95 % 3,25–17,20; p < 0,001).
- FC máxima por 10 lpm (básico): OR 0,82 (IC 95 % 0,68–1,00; p = 0,048). Depresión ST por mm: OR 1,82 (IC 95 % 1,23–2,69; p = 0,003).
- Colesterol por 40 mg/dL (básico): OR 1,21 (IC 95 % 0,92–1,58; p = 0,175). Edad por 10 años: OR 1,25 (IC 95 % 0,82–1,91; p = 0,294).
- Extendido: vasos por fluoroscopia OR 3,71 (IC 95 % 2,15–6,41; p < 0,001); talio con defecto reversible OR 4,03 (IC 95 % 1,75–9,27; p = 0,001).
- Razón de verosimilitud básico vs. extendido: χ² = 43,6, gl = 3, p < 0,001.

## Predicción (OE3–OE4, H-2 a H-4)

| Modelo | AUC CV (P2,5–P97,5) | AUC fuera de muestra, DeLong IC 95 % | Brier | Pendiente de calibración | Sens./Esp. con umbral 0,5 | Esp. con sens. ≥ 90 % |
|---|---|---|---|---|---|---|
| RL 4 continuas (semestre 1) | 0,749 (0,612–0,865) | 0,746 (0,690–0,801) | 0,205 | 0,93 | 0,650 / 0,769 | 0,344 |
| RL básica (no invasiva) | 0,874 (0,794–0,949) | 0,875 (0,836–0,914) | 0,146 | 0,91 | 0,752 / 0,844 | 0,613 |
| RL extendida (+ imagen) | 0,909 (0,829–0,964) | 0,904 (0,870–0,938) | 0,120 | 0,84 | 0,788 / 0,875 | 0,700 |
| Árbol CART (extendido) | 0,842 (0,715–0,940) | 0,847 (0,802–0,893) | 0,163 | 0,26 | 0,737 / 0,875 | 0,519 |
| Random Forest (extendido) | 0,910 (0,833–0,964) | 0,905 (0,872–0,938) | 0,127 | 1,59 | 0,759 / 0,875 | 0,719 |

- **H-2:** AUC corregido por optimismo del modelo básico = 0,880 (optimismo 0,021); límite inferior del IC de DeLong = 0,836 > 0,80 → **se rechaza H0**.
- **H-3:** ΔAUC extendido − básico = 0,035 (IC 95 % 0,008 a 0,062; p = 0,012) → **la imagen aporta, aunque de forma modesta**.
- **H-4:** ΔAUC RL extendida − CART = 0,067 (IC 95 % 0,021 a 0,113; p = 0,004) → **la RL discrimina mejor que el árbol**. RL extendida vs. RF: ΔAUC = -0,001 (p = 0,936), es decir, sin diferencia.
- Mejora frente al semestre 1: ΔAUC básico − 4 continuas = 0,125 (p < 0,001).
- Árbol: hiperparámetros modales {'max_depth': 4, 'min_samples_leaf': 10}, elegidos en solo el 32 % de las particiones (inestable); pendiente de calibración 0,26 (sobreajuste).
- Tamizaje (RL básica, sensibilidad ≥ 90 %): umbral 0,24, especificidad 0,613, VPN 0,883.

## Tamaño de muestra

- Riley (2020): se requieren n = 412 (básico) y n = 382 (extendido); se dispone de n = 297. EPV = 9,8 (básico) y 8,1 (extendido). Margen de la prevalencia: ± 5,7 %.
