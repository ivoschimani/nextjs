# GutscheinWERFT – Next.js Docker helpers
# Usage: make <target>

COMPOSE = docker compose -f /var/www/nextjs/docker-compose.yml

.PHONY: up down restart build logs shell mongo-shell clean rebuild

## Start all services (builds image if needed)
up:
	$(COMPOSE) up -d

## Stop all services
down:
	$(COMPOSE) down

## Restart the Next.js container only
restart:
	$(COMPOSE) restart nextjs

## Force-rebuild the Docker image and restart
rebuild:
	$(COMPOSE) down nextjs
	$(COMPOSE) build --no-cache nextjs
	$(COMPOSE) up -d nextjs

## Follow Next.js logs
logs:
	$(COMPOSE) logs -f nextjs

## Open a shell inside the Next.js container
shell:
	$(COMPOSE) exec nextjs sh

## Run npm commands inside the container, e.g.: make npm CMD="run build"
npm:
	$(COMPOSE) exec nextjs npm $(CMD)

## Open mongosh
mongo-shell:
	$(COMPOSE) exec mongo mongosh -u USERNAME -p PASSWORD gutscheinwerft

## Remove containers, named volumes (⚠ deletes DB data)
clean:
	$(COMPOSE) down -v

## Show status
status:
	$(COMPOSE) ps
