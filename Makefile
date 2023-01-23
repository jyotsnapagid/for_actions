

pylint-src:
	PYTHONPATH="src/" pylint --recursive=true src/ -f parseable | tee pylint.out

test: requirements-dev.txt
	if [ ! -d env-test ]; then \
    	python3 -m venv env-test; \
        source env-test/bin/activate; \
        pip3 install -r requirements-dev.txt; \
	fi
	source env-test/bin/activate; python3 -m pytest -vv --cov src/ && coverage xml && coverage html && pylint src/ -f parseable | tee code-cov/pylint.out; mv htmlcov code-cov/; mv coverage.xml code-cov;

