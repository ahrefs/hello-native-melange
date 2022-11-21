project_name = hello-native-bucklescript
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
	opam switch create . --deps-only

.PHONY: init
init: create-switch install pins ## Configure everything to develop this repository in local

.PHONY: pins
pins: ## Pin development dependencies
	opam pin add $(project_name).dev .

.PHONY: install
install: ## Install development dependencies
	opam install . --deps-only --with-test

.PHONY: deps
deps: $(opam_file) ## Alias to update the opam file and install the needed deps

.PHONY: build_js
build_js: ## Build the Melange project
	$(DUNE) build @exe_js

.PHONY: build_native
build_native: ## Build the native project
	$(DUNE) build @exe_native

.PHONY: build
build: build_js build_native ## Build both Melange and native projects

.PHONY: run_js
run_js: ## Run the js project
	node _build/default/exes/date/exes/js

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
	$(DUNE) build @@default --watch

$(opam_file): $(project_name).opam.template dune-project ## Update the package dependencies when new deps are added to dune-project
	opam exec -- dune build @install        # Update the $(project_name).opam file
