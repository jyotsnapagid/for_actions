TIMESTAMP=$(shell date +%Y%m%d%H%M%S)
VERSION=$(shell git branch --show-current)


pylint-src:
	PYTHONPATH="src/" pylint --recursive=true src/ -f parseable | tee pylint.out

docker-build:
	docker build -t $(ECR_REGISTRY)/testing_repo:$(VERSION) -f Dockerfile .

docker-push:
	docker push $(ECR_REGISTRY)/testing_repo:$(VERSION)

test: requirements-dev.txt
	if [ ! -d env-test ]; then \
    	python3 -m venv env-test; \
        source env-test/bin/activate; \
        pip3 install -r requirements-dev.txt; \
	fi
	source env-test/bin/activate; python3 -m pytest -vv --cov src/ && coverage xml && coverage html && pylint src/ -f parseable | tee code-cov/pylint.out; mv htmlcov code-cov/; mv coverage.xml code-cov;

cwl-validate: requirements-dev.txt
	if [ ! -d env-test ]; then \
    	python3 -m venv env-test; \
        source env-test/bin/activate; \
        pip3 install -r requirements-dev.txt; \
	fi
	source env-test/bin/activate; cwl-runner --validate CWL/*;

push-cov:
	git config user.name github-actions
	git config user.email github-actions@github.com
	git add code-cov/*; git add -f code-cove/htmlcov/index.html; git commit -m 'code-cov commit at $(TIMESTAMP)'; git push origin $(VERSION)

echo-timestamp:
	echo $(TIMESTAMP)
