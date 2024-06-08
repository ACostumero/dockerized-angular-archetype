# Makefile

# Include .env variables
include .env

# Build the Docker image
build:
	docker-compose build --build-arg ANGULAR_CLI_VERSION=$(ANGULAR_CLI_VERSION) --build-arg NODE_VERSION=$(NODE_VERSION)

# Stop and remove containers
up:
	docker-compose up -d

# Create a new Angular app
ng-new:
	docker-compose exec $(ANGULAR_SERVICE) ng new $(APP_NAME) --directory .

# Install dependencies
npm-install:
	docker-compose exec $(ANGULAR_SERVICE) npm install

# Serve the Angular app
serve:
	docker-compose exec $(ANGULAR_SERVICE) ng serve --host 0.0.0.0

# Stop and remove containers
stop:
	docker-compose down

# Clean up dependencies and generated files
clean:
	rm -rf node_modules dist

exec:
	docker exec -it

# Exec the container using docker-compose
compose-exec:
	docker-compose run --rm $(ANGULAR_SERVICE) sh

# Help command
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  build               Build the Docker image"
	@echo "  ng-new APP_NAME     Create a new Angular app"
	@echo "  npm-install         Install dependencies"
	@echo "  serve               Serve the Angular app"
	@echo "  stop                Stop and remove containers"
	@echo "  clean               Clean up dependencies and generated files"
	@echo "  exec                Exec the container"
	@echo "  compose-exec        Exec the container using docker-compose"
	@echo "  help                Show this help message"
