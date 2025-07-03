# 🤖 AI-dev-py-template Setup Guide

Welcome to your new AI-assisted Python development project! This template provides a comprehensive development environment with automated workflows, quality assurance, and AI-friendly coding standards.

## ✅ Quick Start Checklist

After creating a new repository from this template, follow these steps:

### 1. 📝 **Update Project Information**

**Edit `pyproject.toml`:**
```toml
[project]
name = "your-project-name"  # ← Change this
version = "0.1.0"
description = "Your project description"  # ← Change this
authors = [
    {name = "Your Name", email = "your.email@example.com"}  # ← Change this
]

[project.urls]
Homepage = "https://github.com/yourusername/your-repo"  # ← Change this
Repository = "https://github.com/yourusername/your-repo.git"  # ← Change this
Issues = "https://github.com/yourusername/your-repo/issues"  # ← Change this

[tool.isort]
known_first_party = ["your_package_name"]  # ← Change this
```

**Edit `README.md`:**
- Update project title and description
- Replace repository URLs
- Update badges with your repository path
- Customize the features list for your project

**Edit `src/__init__.py`:**
```python
"""Your Project Name - Brief Description."""

__version__ = "0.1.0"
__author__ = "Your Name"
__email__ = "your.email@example.com"
```

### 2. 🏗️ **Set Up Development Environment**

```bash
# Clone your new repository
git clone https://github.com/yourusername/your-repo.git
cd your-repo

# Set up development environment
make setup-env
source venv/bin/activate  # On Windows: venv\Scripts\activate
make install-dev

# Verify setup works
make ci
```

### 3. 🧪 **Replace Example Code**

**Replace the example calculator:**
1. Delete `src/calculator.py` (example module)
2. Delete `tests/test_calculator.py` (example tests)
3. Create your own modules in `src/`
4. Create corresponding tests in `tests/`

**Keep the project structure:**
```
your-repo/
├── src/
│   ├── __init__.py          # ← Update this
│   └── your_modules.py      # ← Add your code here
├── tests/
│   ├── __init__.py          # ← Keep this
│   └── test_your_modules.py # ← Add your tests here
```

### 4. 🔧 **Configure GitHub Repository**

**Enable GitHub Actions:**
- Go to your repository Settings → Actions → General
- Allow all actions and reusable workflows

**Set up branch protection (recommended):**
- Go to Settings → Branches
- Add rule for `main` branch
- Require status checks to pass before merging
- Require pull request reviews

### 5. 🤖 **AI-Assisted Development Setup**

**Open in Cursor:**
```bash
# If you have Cursor installed
cursor .
```

**Configure AI Development Environment:**
The template includes optimized settings for AI-assisted development:
- `.vscode/settings.json` - Editor configuration for AI tools
- Comprehensive type hints for better AI understanding
- Numpy-style docstrings for detailed AI context
- Clean architecture patterns for AI comprehension

**Start developing with AI assistance:**
```bash
# Create new feature branch
make branch-from-issue

# Develop with TDD
make test-watch  # Keep this running while developing

# Use AI to:
# - "Write tests for [functionality] with numpy-style docstrings"
# - "Implement [feature] following clean architecture patterns"
# - "Add comprehensive type hints to this function"
# - "Refactor this code for better AI understanding"
```

### 6. 📊 **Verify Everything Works**

```bash
# Run full CI pipeline
make ci

# Check workflow monitoring
make workflow-status

# Create a test issue and PR
make issue
make pr
```

## 🎯 **Available Commands**

### Core Development
| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make setup-env` | Set up development environment |
| `make install-dev` | Install development dependencies |
| `make test` | Run tests with coverage |
| `make test-watch` | Run tests in watch mode |
| `make ci` | Run full CI pipeline locally |

### Code Quality
| Command | Description |
|---------|-------------|
| `make format` | Format code (black + isort) |
| `make lint` | Run linting (flake8) |
| `make type-check` | Run type checking (mypy) |
| `make security-check` | Run security scanning (bandit) |

### Workflow Management
| Command | Description |
|---------|-------------|
| `make workflow-status` | Check GitHub workflow status |
| `make check-workflows` | Analyze workflow failures |
| `make auto-fix` | Automatically fix common issues |
| `make auto-fix-push` | Fix issues and push changes |

### Template Setup
| Command | Description |
|---------|-------------|
| `make setup-template` | Interactive template setup |
| `make setup-template-clean` | Setup with example removal |

## 🔄 **AI-Assisted Development Workflow**

### 1. Create Issue with AI
```bash
# Create detailed issue with AI assistance
make issue

# AI prompt example:
# "Create a comprehensive issue for implementing user authentication
# with email validation, password hashing, and session management"
```

### 2. Branch Creation
```bash
# Create feature branch from GitHub issue
make branch-from-issue
```

### 3. Test-Driven Development
```bash
# Start test watching
make test-watch

# Use AI to generate tests:
# "Write comprehensive tests for email validation with edge cases"
# "Generate parametrized tests for password hashing"
# "Create integration tests for authentication flow"
```

### 4. Implementation with AI
```python
# AI-friendly implementation patterns:

# 1. Use comprehensive type hints
from typing import Optional, Dict, Any, List
from pathlib import Path

def process_user_data(
    user_data: dict[str, Any],
    validation_rules: list[str],
    output_path: Optional[Path] = None
) -> dict[str, Any]:
    """
    Process user data with comprehensive validation.

    Parameters
    ----------
    user_data : dict[str, Any]
        Raw user data to process
    validation_rules : list[str]
        List of validation rules to apply
    output_path : Optional[Path], default=None
        Path to save processed data

    Returns
    -------
    dict[str, Any]
        Processed and validated user data
    """
    # Implementation here
    pass

# 2. Use numpy-style docstrings
# 3. Follow clean architecture patterns
# 4. Include comprehensive examples
```

### 5. Quality Assurance
```bash
# Run all quality checks
make ci

# Auto-fix common issues
make auto-fix

# Check workflow status
make workflow-status
```

## 📚 **Template Features for AI Development**

### ✅ **AI-Optimized Code Structure**
- **Comprehensive Type Hints**: Every function and class includes complete type annotations
- **Numpy-Style Docstrings**: Detailed, structured documentation with examples
- **Clean Architecture**: Clear separation of concerns and design patterns
- **Immutable Operations**: Functions without side effects for better AI understanding

### ✅ **Development Environment**
- **Python 3.11+**: Modern Python with latest features
- **Virtual Environment**: Isolated dependency management
- **One-Command Setup**: `make setup-env` for instant development
- **Pre-commit Hooks**: Automated quality checks

### ✅ **Code Quality Assurance**
- **Black Formatting**: 88-character line length, consistent style
- **isort Import Sorting**: Organized imports with Black compatibility
- **flake8 Linting**: Code quality enforcement
- **mypy Type Checking**: Strict type checking for AI assistance
- **bandit Security**: Vulnerability scanning
- **pytest Testing**: 80%+ coverage target

### ✅ **Automated Workflows**
- **GitHub Actions CI/CD**: Multi-version testing and quality checks
- **Auto-formatting**: Weekly automated code formatting
- **Auto-fix**: Automatic resolution of common CI failures
- **Workflow Monitoring**: Real-time status and failure analysis

### ✅ **AI Integration**
- **Cursor Optimized**: Tailored for Cursor AI IDE
- **GitHub Copilot Ready**: Compatible with GitHub Copilot
- **Context-Rich Documentation**: Comprehensive examples and patterns
- **AI-Friendly Commands**: Simplified workflow operations

## 🛠️ **Customization Guide**

### Adding New Dependencies

**For production dependencies:**
```bash
# Edit pyproject.toml
[project]
dependencies = [
    "requests>=2.31.0",
    "pydantic>=2.0.0",
    "fastapi>=0.100.0",
]
```

**For development dependencies:**
```bash
# Edit pyproject.toml
[project.optional-dependencies]
dev = [
    # ... existing dependencies
    "new-dev-package>=1.0.0",
]
```

### Adding New Modules

**Create new module with AI-friendly structure:**
```python
# src/your_module.py
"""
Your module description.

This module provides functionality for [specific purpose]
with comprehensive type hints and numpy-style docstrings.
"""

from typing import Dict, List, Optional, Any
from pathlib import Path

class YourClass:
    """
    Class description with comprehensive docstring.

    Parameters
    ----------
    config : dict[str, Any]
        Configuration dictionary

    Attributes
    ----------
    config : dict[str, Any]
        Configuration settings

    Examples
    --------
    >>> your_class = YourClass({'key': 'value'})
    >>> result = your_class.process_data(data)
    """

    def __init__(self, config: dict[str, Any]) -> None:
        """Initialize with configuration."""
        self.config = config
```

### Testing New Modules

**Create comprehensive tests:**
```python
# tests/test_your_module.py
"""
Comprehensive tests for your_module.

This test suite covers all functionality with edge cases
and follows TDD principles for AI-assisted development.
"""

import pytest
from typing import Dict, Any

from src.your_module import YourClass


class TestYourClass:
    """Test suite for YourClass."""

    def test_initialization(self) -> None:
        """Test class initialization."""
        config = {'key': 'value'}
        instance = YourClass(config)
        assert instance.config == config
```

## 🔍 **Troubleshooting**

### Common Issues

**Environment setup fails:**
```bash
# Clean and retry
make clean
make setup-env
```

**Tests not running:**
```bash
# Check Python path and reinstall
echo $PYTHONPATH
make clean && make install-dev
```

**Pre-commit hooks failing:**
```bash
# Update hooks
pre-commit autoupdate
make format
```

**Type checking errors:**
```bash
# Install missing type stubs
pip install types-requests types-PyYAML
```

### AI-Specific Issues

**AI not understanding code structure:**
- Ensure all functions have comprehensive type hints
- Use numpy-style docstrings with examples
- Follow clean architecture patterns

**AI suggestions not accurate:**
- Check that docstrings include detailed examples
- Verify type hints are complete and accurate
- Ensure code follows established patterns

## 📖 **Additional Resources**

- **[Main README](README.md)**: Comprehensive project overview
- **[Development Workflow](docs/DEVELOPMENT_WORKFLOW.md)**: Detailed development process
- **[Workflow Monitoring](docs/WORKFLOW_MONITORING.md)**: Automated workflow management
- **[AI Context Documentation](docs/AI_CONTEXT.md)**: AI development best practices

## 🤝 **Support**

For issues or questions:
1. Check the documentation files
2. Review the example code
3. Run `make help` for available commands
4. Create an issue in the repository

Happy coding with AI assistance! 🚀
