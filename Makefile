.PHONY: help
		create-containers


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

create-containers: ## Automatically creates the docker containers
	@docker compose -f docker-compose.yaml up -d