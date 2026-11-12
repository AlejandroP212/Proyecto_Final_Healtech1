# Uso:  make setup   -> crea el entorno e instala dependencias
#       make all     -> ejecuta los notebooks 01-05 en orden y guarda sus salidas (tablas, figuras, métricas)
#       make verify  -> vuelve a ejecutar todo y comprueba que resultados.json sea idéntico
PY ?= .venv/bin/python
# El kernel python3 lanza el "python" del PATH: se antepone el del entorno del proyecto.
export PATH := $(CURDIR)/.venv/bin:$(PATH)
NOTEBOOKS = notebooks/01_datos_y_auditoria.ipynb notebooks/02_descriptivo.ipynb \
            notebooks/03_asociacion.ipynb notebooks/04_modelos_predictivos.ipynb \
            notebooks/05_resumen_resultados.ipynb
EXEC = $(PY) -m nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=1800

.PHONY: setup all verify clean paper-figs

setup:
	python3 -m venv --clear .venv
	$(PY) -m pip install --upgrade pip
	$(PY) -m pip install -r requirements.txt

all:
	@for nb in $(NOTEBOOKS); do echo ">> $$nb"; $(EXEC) $$nb || exit 1; done
	$(MAKE) paper-figs

# Copia las figuras al paper para que paper/ sea autocontenido (subir la carpeta tal cual a Overleaf)
paper-figs:
	cp results/figures/*.png paper/Figuras/

verify:
	cp results/resultados.json results/.resultados_prev.json
	$(MAKE) all
	cmp results/resultados.json results/.resultados_prev.json && echo "OK: resultados idénticos"; rm -f results/.resultados_prev.json

clean:
	rm -rf results/figures/*.png results/tables/* results/json results/resultados.json data/processed/*.csv
