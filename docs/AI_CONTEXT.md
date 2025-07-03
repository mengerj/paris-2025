# 🤖 AI Development Context

This document provides comprehensive context for AI models working with the AI-dev-py-template. It includes coding standards, architectural patterns, examples, and best practices specifically designed for AI understanding and code generation.

## 📋 Project Overview

**AI-dev-py-template** is a comprehensive Python development template optimized for AI-assisted development. It provides:

- **Production-ready structure** with modern Python 3.11+ features
- **Comprehensive type hints** for better AI understanding
- **Numpy-style docstrings** with detailed examples
- **Automated quality assurance** with CI/CD pipelines
- **Clean architecture patterns** for maintainable code

## 🏗️ Project Structure

```
AI-dev-py-template/
├── src/                          # Source code (main package)
│   ├── __init__.py              # Package initialization
│   └── calculator.py            # Example module with clean patterns
├── tests/                       # Test files (mirror src structure)
│   ├── __init__.py             # Test package initialization
│   └── test_calculator.py      # Comprehensive test examples
├── docs/                        # Documentation
│   ├── DEVELOPMENT_WORKFLOW.md # Development process guide
│   ├── WORKFLOW_MONITORING.md  # Workflow monitoring guide
│   └── AI_CONTEXT.md           # This file - AI development context
├── scripts/                     # Automation scripts
│   ├── check_workflows.py      # Workflow analysis and monitoring
│   ├── auto_fix_workflow.py    # Automatic CI/CD fixes
│   └── setup_template.py       # Template setup and customization
├── .github/                     # GitHub configuration
│   ├── workflows/              # GitHub Actions workflows
│   │   ├── ci.yml              # Main CI/CD pipeline
│   │   ├── auto-format.yml     # Automated code formatting
│   │   └── auto-fix.yml        # Automatic workflow fixes
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md # PR template
├── .vscode/                     # VS Code/Cursor configuration
│   ├── settings.json           # Editor settings for AI development
│   └── launch.json             # Debug configurations
├── pyproject.toml              # Project configuration and dependencies
├── Makefile                    # Development commands
├── .pre-commit-config.yaml     # Git pre-commit hooks
├── .flake8                     # Linting configuration
├── requirements.txt            # Production dependencies
└── requirements-dev.txt        # Development dependencies
```

## 🔧 Configuration Overview

### pyproject.toml Key Sections

```toml
[project]
name = "AI-dev-py-template"
requires-python = ">=3.11"
dependencies = []  # Keep minimal for template

[project.optional-dependencies]
dev = [
    "black>=23.0.0",      # Code formatting
    "isort>=5.12.0",      # Import sorting
    "flake8>=6.0.0",      # Linting
    "mypy>=1.5.0",        # Type checking
    "pytest>=7.4.0",      # Testing framework
    "pytest-cov>=4.1.0",  # Coverage reporting
    "bandit>=1.7.0",      # Security scanning
]

[tool.black]
line-length = 88          # Consistent with flake8
target-version = ['py311']

[tool.isort]
profile = "black"         # Black compatibility
line_length = 88

[tool.mypy]
python_version = "3.11"
disallow_untyped_defs = true    # Strict type checking
warn_return_any = true
strict_equality = true

[tool.pytest.ini_options]
testpaths = ["tests"]
addopts = [
    "--cov=src",
    "--cov-report=html",
    "--cov-fail-under=80",  # 80% coverage minimum
]
```

## 📝 Coding Standards

### Type Hints Requirements

**ALL code must include comprehensive type hints:**

```python
# Required imports for type hints
from typing import (
    Dict, List, Optional, Union, Any, Tuple, Set,
    Callable, TypeVar, Generic, Protocol, Literal
)
from pathlib import Path
from datetime import datetime
from dataclasses import dataclass
from enum import Enum

# Literal types for constrained values
LogLevel = Literal["debug", "info", "warning", "error", "critical"]
OutputFormat = Literal["json", "xml", "yaml", "csv"]

# Protocol for duck typing
class Serializable(Protocol):
    """Protocol for serializable objects."""

    def serialize(self) -> Dict[str, Any]:
        """Serialize object to dictionary."""
        ...

# Dataclass for structured data
@dataclass
class UserData:
    """User data structure."""
    name: str
    email: str
    age: Optional[int] = None
    is_active: bool = True
```

### Numpy-Style Docstrings

**ALL functions and classes must use numpy-style docstrings:**

```python
def calculate_user_metrics(
    user_data: List[Dict[str, Any]],
    metric_types: List[str],
    weights: Optional[Dict[str, float]] = None,
    normalize: bool = True
) -> Tuple[Dict[str, float], List[str]]:
    """
    Calculate comprehensive user metrics with weighted scoring.

    Parameters
    ----------
    user_data : List[Dict[str, Any]]
        List of user data dictionaries containing user information
    metric_types : List[str]
        List of metric types to calculate
    weights : Optional[Dict[str, float]], default=None
        Optional weights for each metric type
    normalize : bool, default=True
        Whether to normalize metrics to 0-1 range

    Returns
    -------
    Tuple[Dict[str, float], List[str]]
        Tuple containing calculated metrics and warnings

    Raises
    ------
    ValueError
        If user_data is empty or contains invalid data

    Examples
    --------
    >>> user_data = [{"id": "user1", "activity_score": 0.8}]
    >>> metric_types = ["engagement", "activity"]
    >>> metrics, warnings = calculate_user_metrics(user_data, metric_types)
    >>> metrics["engagement"]
    0.75
    """
    # Implementation here
    pass
```

This comprehensive context provides AI models with all necessary information to understand and work effectively with the AI-dev-py-template codebase.
