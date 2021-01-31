.PHONY: clean lint test coverage coverage-report install install-wb run-wb run

clean:
	@rm -rf .eggs/ build/ dist/ docs/_build/ htmlcov/ *.egg-info/ .coverage
	@-find . -name '__pycache__' -prune -exec rm -rf "{}" \;
	@-find . -name '*.pyc' -delete
	@echo 'cache cleaned....'

lint:
	@python3 -m black .

test: clean lint
	@python3 -m unittest discover tests/

coverage:
	@python3 -m coverage run -m unittest
	@python3 -m coverage html

coverage-report:
	@codecov

install-wb:
	@python3 -m pip install -r library/requirements-workbench.txt

install:
	@python3 -m pip install -r library/requirements.txt

run-wb:
	@source env/workbench.env
	@cd src/main && python3 app.py

run:
	@source env/.env
	@cd src/main && python3 app.py