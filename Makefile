.DEFAULT_GOAL := up
.PHONY: prepare up stop status logs credentials

prepare:
	python3 scripts/configure.py
	sh scripts/install-images.sh

up: prepare
	docker compose up -d --wait
	docker compose run --rm bootstrap
	@echo 'Desk: http://localhost:3001 | Accounts: http://localhost:3000'
	@echo 'Run make credentials to display your local administrator login.'

stop:
	docker compose down

status:
	docker compose ps

logs:
	docker compose logs --tail=100

credentials:
	@python3 scripts/configure.py --credentials
