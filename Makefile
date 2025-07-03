.PHONY: help install install-dev test lint format format-check type-check clean setup-env

# Default target
help:
	@echo "Available commands:"
	@echo ""
	@echo "🏗️  Environment Setup:"
	@echo "  setup-env     - Set up development environment with uv"
	@echo "  install       - Install production dependencies"
	@echo "  install-dev   - Install development dependencies"
	@echo ""
	@echo "🧪 Testing & Quality (Development - Auto-fix):"
	@echo "  test          - Run tests with coverage"
	@echo "  test-watch    - Run tests in watch mode"
	@echo "  lint          - Run linting (flake8)"
	@echo "  format        - Format code (black + isort) - AUTO-FIX"
	@echo "  type-check    - Run type checking (mypy)"
	@echo "  pre-commit    - Run pre-commit hooks"
	@echo ""
	@echo "🔍 CI Quality Checks (Check-only mode):"
	@echo "  format-check  - Check code formatting (black + isort) - NO AUTO-FIX"
	@echo "  ci            - Run full CI pipeline locally (check-only mode)"
	@echo ""
	@echo "🔄 Workflow Management:"
	@echo "  issue              - Create new GitHub issue"
	@echo "  pr                 - Create pull request"
	@echo "  branch-from-issue  - Create branch from GitHub issue"
	@echo "  workflow-status    - Check current workflow status"
	@echo "  check-workflows    - Analyze workflow failures with suggestions"
	@echo "  auto-fix          - Automatically fix workflow failures"
	@echo "  auto-fix-push     - Auto-fix and push changes"
	@echo ""
	@echo "🚀 Template Setup (for new repositories):"
	@echo "  setup-template       - Interactive setup for new project"
	@echo "  setup-template-clean - Setup new project and remove examples"
	@echo ""
	@echo "🧹 Maintenance:"
	@echo "  clean         - Clean build artifacts"
	@echo ""
	@echo "📦 Package Management:"
	@echo "  Use 'uv add package-name' to add new dependencies"
	@echo "  Use 'uv add --dev package-name' for development dependencies"

# Environment setup
setup-env:
	uv venv .venv --python python3
	@echo "Virtual environment created at .venv/"
	@echo "Activate with: source .venv/bin/activate (Linux/Mac) or .venv\\Scripts\\activate (Windows)"
	@echo "Then run: make install-dev"

# Installation
install:
	uv pip install -e .

install-dev:
	uv pip install -e .[dev]
	uv run pre-commit install

# Testing
test:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		pytest -v --cov=src --cov-report=html --cov-report=term-missing; \
	else \
		uv run pytest -v --cov=src --cov-report=html --cov-report=term-missing; \
	fi

test-watch:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		pytest-watch -- -v --cov=src; \
	else \
		uv run pytest-watch -- -v --cov=src; \
	fi

# Code quality - Development (auto-fix)
lint:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		flake8 src tests; \
	else \
		uv run flake8 src tests; \
	fi

format:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		black src tests; \
		isort src tests; \
	else \
		uv run black src tests; \
		uv run isort src tests; \
	fi

type-check:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		mypy src; \
	else \
		uv run mypy src; \
	fi

pre-commit:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		pre-commit run --all-files; \
	else \
		uv run pre-commit run --all-files; \
	fi

# Code quality - CI (check-only, no auto-fix)
format-check:
	@if [ -n "$$VIRTUAL_ENV" ]; then \
		black --check src tests; \
		isort --check-only src tests; \
	else \
		uv run black --check src tests; \
		uv run isort --check-only src tests; \
	fi

# Cleaning
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .venv/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete

# CI pipeline (check-only mode - matches GitHub CI)
ci: format-check lint type-check test
	@echo "✅ All CI checks passed!"

# Development workflow helpers
issue:
	@echo "Creating new issue..."
	@read -p "Issue title: " title; \
	read -p "Issue body: " body; \
	gh issue create --title "$$title" --body "$$body"

pr:
	@echo "Creating pull request..."
	@gh pr create --fill

# Auto-branch creation from issue
branch-from-issue:
	@read -p "Issue number: " issue_num; \
	issue_title=$$(gh issue view $$issue_num --json title --jq '.title'); \
	branch_name=$$(echo "$$issue_title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$$//g'); \
	git checkout -b "feature/$$branch_name-$$issue_num"; \
	echo "Created branch: feature/$$branch_name-$$issue_num"

# Workflow monitoring and fixing
check-workflows:
	@uv run python scripts/check_workflows.py --suggest-fixes

check-workflows-json:
	@uv run python scripts/check_workflows.py --json --suggest-fixes

auto-fix:
	@uv run python scripts/auto_fix_workflow.py --branch $$(git branch --show-current) --commit

auto-fix-push:
	@uv run python scripts/auto_fix_workflow.py --branch $$(git branch --show-current) --commit --push

workflow-status:
	@echo "📊 Current Workflow Status:"
	@uv run python scripts/check_workflows.py
	@echo ""
	@echo "🔗 Recent workflow runs:"
	@gh run list --limit 5

# Template setup (for new repositories created from template)
setup-template:
	@echo "🚀 Setting up new project from template..."
	uv run python scripts/setup_template.py

setup-template-clean:
	@echo "🚀 Setting up new project from template (removing examples)..."
	uv run python scripts/setup_template.py --remove-examples
