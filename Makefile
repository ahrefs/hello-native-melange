project_name = hello-native-melange
DUNE = opam exec -- dune
opam_file = $(project_name).opam

.DEFAULT_GOAL := help

.PHONY: help
help: ## Print this help message
	@echo "List of available make commands";
	@echo "";
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}';
	@echo "";

.PHONY: create-switch
create-switch:
	opam switch create . 5.1.0 -y --deps-only

.PHONY: init
init: create-switch install ## Configure everything to develop this repository in local

.PHONY: install
install: ## Install dependencies
	opam install . --deps-only --with-test

.PHONY: build_melange
build_melange: ## Build the Melange project
	$(DUNE) build @melange

.PHONY: build_native
build_native: ## Build the native project
	$(DUNE) build exes/native.exe

.PHONY: build
build: build_melange build_native ## Build both Melange and native projects

.PHONY: run_melange
run_js: ## Run the melange project
	node _build/default/exes/date/exes/js

.PHONY: run_native
run_native: ## Run the native project
	$(DUNE) exec exes/native.exe

.PHONY: clean
clean: ## Clean build artifacts and other generated files
	$(DUNE) clean

.PHONY: format
format: ## Format the codebase with ocamlformat
	$(DUNE) build @fmt --auto-promote

.PHONY: format-check
format-check: ## Checks if format is correct
	$(DUNE) build @fmt

.PHONY: watch
watch: ## Watch for the filesystem and rebuild on every change
	$(DUNE) build --watch
