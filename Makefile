# Svelte Switch Showcase - Makefile
# Development and build commands for the showcase project

# === Configuration ===
# Docker image settings
DOCKER_IMAGE_NAME = registry.km8.es/svelte-switch-showcase
DOCKER_TAG = production
DOCKER_CONTAINER_NAME = svelte-switch-showcase
DOCKER_PORT = 8080

# Development settings
DEV_PORT = 5173
PREVIEW_PORT = 4173

# Build settings
BUILD_DIR = build
OUTPUT_DIR = .svelte-kit
NODE_MODULES = node_modules
PACKAGE_LOCK = package-lock.json

.PHONY: help install dev build preview clean link-lib package deploy docker-build docker-run docker-stop

# Default target
help: ## Show this help message
	@echo "Svelte Switch Showcase - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

# Development commands
install: ## Install dependencies
	npm install

link-lib: ## Link the @keenmate/svelte-switch library from ../svelte-switch
	cd ../svelte-switch && npm link
	npm link @keenmate/svelte-switch

unlink-lib: ## Unlink the @keenmate/svelte-switch library
	npm unlink @keenmate/svelte-switch

install-published: ## Install published version of @keenmate/svelte-switch
	npm install @keenmate/svelte-switch@latest

dev: ## Start development server
	npm run dev

dev-host: ## Start development server with host access
	npm run dev -- --host

build: ## Build the project for production
	npm run build

preview: ## Preview the production build
	npm run preview

# Quality assurance
check: ## Run type checking
	npm run check

check-watch: ## Run type checking in watch mode
	npm run check:watch

lint: ## Run linting (if configured)
	@echo "Linting not configured yet"

# Library development helpers
build-lib: ## Build the linked svelte-switch library
	cd ../svelte-switch && npm run package

rebuild-lib: ## Rebuild and relink the library
	cd ../svelte-switch && npm run package
	$(MAKE) link-lib

# Cleanup
clean: ## Clean build artifacts
	rm -rf $(BUILD_DIR)/
	rm -rf $(OUTPUT_DIR)/

clean-all: clean ## Clean everything including node_modules
	rm -rf $(NODE_MODULES)/
	rm -rf $(PACKAGE_LOCK)

# Deployment
package: build ## Package for deployment
	@echo "Build completed - ready for deployment"
	@echo "Build output is in: ./$(BUILD_DIR)/"

deploy-vercel: build ## Deploy to Vercel
	@echo "To deploy to Vercel:"
	@echo "1. Install Vercel CLI: npm i -g vercel"
	@echo "2. Run: vercel --prod"

deploy-netlify: build ## Deploy to Netlify
	@echo "To deploy to Netlify:"
	@echo "1. Install Netlify CLI: npm i -g netlify-cli"
	@echo "2. Run: netlify deploy --prod --dir=$(BUILD_DIR)"

deploy-github: build ## Deploy to GitHub Pages
	@echo "To deploy to GitHub Pages:"
	@echo "1. Push $(BUILD_DIR)/ directory to gh-pages branch"
	@echo "2. Enable GitHub Pages in repository settings"

# Development workflows
setup: install ## Complete project setup
	@echo "Project setup complete!"
	@echo "Run 'make dev' to start development server"

setup-dev: install link-lib ## Setup for development with linked library
	@echo "Development setup complete with linked library!"
	@echo "Run 'make dev' to start development server"

fresh-start: clean install dev ## Clean setup and start development

# Documentation helpers
docs-check: ## Check if all documentation pages are accessible
	@echo "Checking documentation pages..."
	@echo "Pages to verify:"
	@echo "- http://localhost:$(DEV_PORT)/ (Homepage)"
	@echo "- http://localhost:$(DEV_PORT)/getting-started"
	@echo "- http://localhost:$(DEV_PORT)/examples/basic"
	@echo "- http://localhost:$(DEV_PORT)/examples/multi"
	@echo "- http://localhost:$(DEV_PORT)/examples/labels"
	@echo "- http://localhost:$(DEV_PORT)/examples/styling"
	@echo "- http://localhost:$(DEV_PORT)/examples/advanced"
	@echo "- http://localhost:$(DEV_PORT)/api/switch"
	@echo "- http://localhost:$(DEV_PORT)/api/multiswitch"

# Testing helpers
test: ## Run tests (when implemented)
	@echo "Tests not configured yet"

test-build: build ## Test that build completes successfully
	@echo "Build test completed successfully"

# Docker commands
docker-build: ## Build Docker image
	@echo "Building Docker image: $(DOCKER_IMAGE_NAME):$(DOCKER_TAG)"
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) .
	@echo "Docker image built successfully!"

docker-run: ## Run Docker container
	@echo "Starting Docker container on port $(DOCKER_PORT)"
	@if [ $$(docker ps -q -f name=$(DOCKER_CONTAINER_NAME)) ]; then \
		echo "Container is already running at http://localhost:$(DOCKER_PORT)"; \
	elif [ $$(docker ps -aq -f name=$(DOCKER_CONTAINER_NAME)) ]; then \
		echo "Starting existing container"; \
		docker start $(DOCKER_CONTAINER_NAME); \
		echo "Application is running at: http://localhost:$(DOCKER_PORT)"; \
	else \
		echo "Creating and starting new container"; \
		docker run -d --name $(DOCKER_CONTAINER_NAME) -p $(DOCKER_PORT):80 $(DOCKER_IMAGE_NAME):$(DOCKER_TAG); \
		echo "Application is running at: http://localhost:$(DOCKER_PORT)"; \
	fi

docker-stop: ## Stop Docker container
	@echo "Stopping Docker container"
	@if [ $$(docker ps -q -f name=$(DOCKER_CONTAINER_NAME)) ]; then \
		docker stop $(DOCKER_CONTAINER_NAME); \
		echo "Container stopped successfully"; \
	else \
		echo "Container is not running"; \
	fi

docker-restart: docker-stop docker-run ## Restart Docker container

docker-logs: ## Show Docker container logs
	@if [ $$(docker ps -aq -f name=$(DOCKER_CONTAINER_NAME)) ]; then \
		docker logs -f $(DOCKER_CONTAINER_NAME); \
	else \
		echo "Container does not exist"; \
	fi

docker-clean: docker-stop ## Remove Docker container and image
	@echo "Cleaning up Docker resources"
	@if [ $$(docker ps -aq -f name=$(DOCKER_CONTAINER_NAME)) ]; then \
		docker rm $(DOCKER_CONTAINER_NAME); \
		echo "Container removed"; \
	fi
	@if [ $$(docker images -q $(DOCKER_IMAGE_NAME):$(DOCKER_TAG)) ]; then \
		docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_TAG); \
		echo "Image removed"; \
	fi

docker-deploy: docker-build docker-run ## Build and run Docker container

# Information
status: ## Show project status
	@echo "Svelte Switch Showcase Status:"
	@echo "Node version: $(shell node --version)"
	@echo "NPM version: $(shell npm --version)"
	@echo "Project directory: $(shell pwd)"
	@echo "Library linked: $(shell npm list @keenmate/svelte-switch 2>/dev/null | grep @keenmate/svelte-switch || echo 'Not linked')"
	@echo "Dependencies installed: $(shell test -d $(NODE_MODULES) && echo "✓" || echo "✗")"
	@echo "Build exists: $(shell test -d $(BUILD_DIR) && echo "✓" || echo "✗")"

info: status ## Alias for status