# Include .env variables
include .env
# Default variable for angular service in docker-compose
ANGULAR_SERVICE=angular-app

# Build the Docker image
build:
	docker-compose build --build-arg ANGULAR_CLI_VERSION=$(ANGULAR_CLI_VERSION) --build-arg NODE_IMAGE=$(NODE_IMAGE)

# Up containers
up:
	docker-compose up -d

# Create a new Angular app
ng-new:
	docker-compose exec $(ANGULAR_SERVICE) ng new $(APP_NAME) --directory .

# Install dependencies
install-deps:
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

# Exec the angular service
exec:
	docker-compose run --rm $(ANGULAR_SERVICE) sh

# Help command
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  build               Build the Docker image"
	@echo "  ng-new APP_NAME     Create a new Angular app"
	@echo "  install-deps        Install dependencies"
	@echo "  serve               Serve the Angular app"
	@echo "  stop                Stop and remove containers"
	@echo "  clean               Clean up dependencies and generated files"
	@echo "  exec        		 Exec the Angular service"
	@echo "  help                Show this help message"
