# 🤖 AI-dev-py-template

**A comprehensive Python development template optimized for AI-assisted development (Cursor, GitHub Copilot, etc.)**

This repository serves as a production-ready template for Python projects that leverage AI assistance for development. It provides a complete development environment with automated workflows, quality assurance, and AI-friendly coding standards.

[![CI](https://github.com/mengerj/AI-dev-py-template/actions/workflows/ci.yml/badge.svg)](https://github.com/mengerj/AI-dev-py-template/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/mengerj/AI-dev-py-template/branch/main/graph/badge.svg)](https://codecov.io/gh/mengerj/AI-dev-py-template)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)

## 🎯 Purpose

This template is specifically designed for:
- **AI-Assisted Development**: Optimized for Cursor, GitHub Copilot, and other AI coding assistants
- **Production-Ready Code**: Comprehensive quality assurance and testing
- **Developer Experience**: Zero-friction setup and automated workflows
- **Best Practices**: Modern Python development standards

## ✨ Features

### 🤖 AI-Optimized Development
- **Comprehensive Type Hints**: Full type annotations for better AI understanding
- **Numpy-Style Docstrings**: Detailed, structured documentation for AI context
- **Clean Architecture**: Clear separation of concerns and patterns
- **AI-Friendly Structure**: Logical project organization for AI comprehension

### 🔧 Development Environment
- **Python 3.11+**: Modern Python with latest features
- **Virtual Environment**: Isolated dependencies
- **One-Command Setup**: `make setup-env` for instant development
- **Pre-commit Hooks**: Automated quality checks on commit

### 📊 Quality Assurance
- **Black Formatting**: 88-character line length, consistent style
- **isort Import Sorting**: Organized imports with Black compatibility
- **flake8 Linting**: Code quality enforcement
- **mypy Type Checking**: Strict type checking for better AI assistance
- **bandit Security**: Security vulnerability scanning
- **pytest Testing**: Comprehensive test framework with 80%+ coverage

### 🚀 Automated Workflows
- **GitHub Actions CI/CD**: Multi-version testing and quality checks
- **Auto-formatting**: Weekly automated code formatting
- **Auto-fix**: Automatic resolution of common CI failures
- **Workflow Monitoring**: Real-time status and failure analysis

## 🚀 Quick Start

### Prerequisites
- Python 3.11 or higher
- [uv](https://github.com/astral-sh/uv) - Fast Python package installer and resolver
- Git
- [GitHub CLI](https://cli.github.com/) (optional, for automated workflows)

**Install uv:**
```bash
# macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

# Or via pip
pip install uv
```

### Setup
```bash
# Use this template to create a new repository
# Or clone directly:
git clone https://github.com/mengerj/AI-dev-py-template.git
cd AI-dev-py-template

# Set up development environment
make setup-env
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
make install-dev

# Verify setup
make ci
```

### First Development Steps
```bash
# View available commands
make help

# Start developing with TDD
make test-watch

# Format code
make format

# Run full quality checks
make ci
```

## 📦 Package Management

This template uses **uv** for fast and reliable package management:

### Adding Dependencies

**Production dependencies:**
```bash
# Add a new production dependency
uv add "package-name>=1.0.0"

# Add multiple packages
uv add "requests>=2.31.0" "pydantic>=2.0.0"

# Add with specific version
uv add "fastapi==0.104.1"
```

**Development dependencies:**
```bash
# Add development-only dependencies
uv add --dev "pytest-mock>=3.0.0"
uv add --dev "black>=23.0.0" "isort>=5.12.0"
```

### Managing Dependencies

```bash
# Update all dependencies
uv lock

# Sync environment with lockfile
uv sync

# Install from requirements
uv pip install -r requirements.txt

# Export current dependencies
uv pip freeze > requirements.txt
```

### Working with Virtual Environments

```bash
# Create virtual environment
uv venv .venv

# Activate virtual environment
source .venv/bin/activate  # Linux/Mac
.venv\Scripts\activate     # Windows

# Install project in development mode
uv pip install -e .

# Install with development dependencies
uv pip install -e .[dev]
```

## 📋 Coding Standards for AI Development

### Type Hints Requirements
All code must include comprehensive type hints:

```python
from typing import List, Dict, Optional, Union, Any
from pathlib import Path

def process_data(
    data: list[dict[str, Any]],
    output_path: Path,
    batch_size: Optional[int] = None
) -> dict[str, Union[int, str]]:
    """
    Process data with type hints for AI understanding.

    Parameters
    ----------
    data : list[dict[str, Any]]
        Input data as list of dictionaries
    output_path : Path
        Path to output file
    batch_size : Optional[int], default=None
        Processing batch size

    Returns
    -------
    dict[str, Union[int, str]]
        Processing results with statistics
    """
    # Implementation with full type safety
    pass
```

### Numpy-Style Docstrings
All functions and classes must use numpy-style docstrings:

```python
def calculate_metrics(
    predictions: np.ndarray,
    targets: np.ndarray,
    weights: Optional[np.ndarray] = None
) -> dict[str, float]:
    """
    Calculate evaluation metrics for model predictions.

    Parameters
    ----------
    predictions : np.ndarray
        Model predictions, shape (n_samples, n_classes)
    targets : np.ndarray
        Ground truth labels, shape (n_samples,)
    weights : Optional[np.ndarray], default=None
        Sample weights, shape (n_samples,)

    Returns
    -------
    dict[str, float]
        Dictionary containing:
        - 'accuracy': Overall accuracy score
        - 'precision': Precision score
        - 'recall': Recall score
        - 'f1': F1 score

    Raises
    ------
    ValueError
        If predictions and targets have incompatible shapes

    Examples
    --------
    >>> predictions = np.array([[0.9, 0.1], [0.3, 0.7]])
    >>> targets = np.array([0, 1])
    >>> metrics = calculate_metrics(predictions, targets)
    >>> metrics['accuracy']
    1.0
    """
    # Implementation here
    pass
```

### Class Documentation
Classes must include comprehensive docstrings:

```python
class DataProcessor:
    """
    Process and transform data for machine learning pipelines.

    This class handles data cleaning, feature engineering, and preprocessing
    with support for various data formats and transformations.

    Parameters
    ----------
    config : dict[str, Any]
        Configuration dictionary with processing parameters
    verbose : bool, default=False
        Whether to print processing information

    Attributes
    ----------
    config : dict[str, Any]
        Processing configuration
    is_fitted : bool
        Whether the processor has been fitted to data
    feature_names : list[str]
        Names of processed features

    Examples
    --------
    >>> config = {'normalize': True, 'handle_missing': 'mean'}
    >>> processor = DataProcessor(config)
    >>> processed_data = processor.fit_transform(raw_data)
    """

    def __init__(self, config: dict[str, Any], verbose: bool = False) -> None:
        """Initialize the data processor."""
        self.config = config
        self.verbose = verbose
        self.is_fitted = False
        self.feature_names: list[str] = []
```

### Error Handling
Proper exception handling with custom exceptions:

```python
class DataProcessingError(Exception):
    """Raised when data processing fails."""
    pass

class InvalidConfigurationError(DataProcessingError):
    """Raised when configuration is invalid."""
    pass

def validate_config(config: dict[str, Any]) -> None:
    """
    Validate configuration parameters.

    Parameters
    ----------
    config : dict[str, Any]
        Configuration to validate

    Raises
    ------
    InvalidConfigurationError
        If configuration is invalid
    """
    required_keys = ['input_format', 'output_format']
    for key in required_keys:
        if key not in config:
            raise InvalidConfigurationError(f"Missing required key: {key}")
```

## 🏗️ Project Structure

```
AI-dev-py-template/
├── src/                          # Source code
│   ├── __init__.py              # Package initialization
│   └── calculator.py            # Example module with clean architecture
├── tests/                       # Test files
│   ├── __init__.py             # Test package initialization
│   └── test_calculator.py      # Comprehensive test examples
├── docs/                        # Documentation
│   ├── DEVELOPMENT_WORKFLOW.md # Development process
│   ├── WORKFLOW_MONITORING.md  # Workflow monitoring guide
│   └── AI_CONTEXT.md           # AI development context
├── scripts/                     # Automation scripts
│   ├── check_workflows.py      # Workflow analysis
│   ├── auto_fix_workflow.py    # Automatic fixes
│   └── setup_template.py       # Template setup
├── .github/                     # GitHub workflows and templates
│   ├── workflows/
│   │   ├── ci.yml              # Main CI pipeline
│   │   ├── auto-format.yml     # Automated formatting
│   │   └── auto-fix.yml        # Automatic workflow fixes
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── .vscode/                     # VS Code/Cursor settings
│   ├── settings.json           # Editor configuration
│   └── launch.json             # Debug configurations
├── pyproject.toml              # Project configuration
├── Makefile                    # Development commands
├── .pre-commit-config.yaml     # Git hooks
├── .flake8                     # Linting configuration
├── requirements.txt            # Production dependencies
└── requirements-dev.txt        # Development dependencies
```

## 🤖 AI Development Workflow

### 1. Test-Driven Development with AI

```bash
# Start with AI-generated tests
make test-watch

# Use AI prompts like:
# "Write comprehensive tests for email validation with edge cases"
# "Generate parametrized tests for the calculator module"
# "Create integration tests for the data processing pipeline"
```

### 2. Implementation with AI Assistance

```python
# Example AI prompts for implementation:
# "Implement EmailValidator following clean architecture principles"
# "Create a data processing class with proper error handling"
# "Add logging and monitoring to the existing function"
```

### 3. Quality Assurance

```bash
# Run all quality checks
make ci

# Auto-fix common issues
make auto-fix

# Check workflow status
make workflow-status
```

### 4. Automated Workflows

The template includes automated workflows for:
- **CI/CD**: Continuous integration with multi-version testing
- **Auto-formatting**: Weekly automated code formatting PRs
- **Auto-fix**: Automatic resolution of common CI failures
- **Monitoring**: Real-time workflow status and failure analysis

## 📋 Available Commands

### Core Development
| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make setup-env` | Set up development environment |
| `make install-dev` | Install development dependencies |
| `make test` | Run tests with coverage |
| `make test-watch` | Run tests in watch mode |
| `make ci` | Run full CI pipeline locally |

### Code Quality (Development - Auto-fix)
| Command | Description |
|---------|-------------|
| `make format` | Format code (black + isort) - **AUTO-FIX** |
| `make lint` | Run linting (flake8) |
| `make type-check` | Run type checking (mypy) |
| `make security-check` | Run security scanning (bandit) |

### CI Quality Checks (Check-only mode)
| Command | Description |
|---------|-------------|
| `make format-check` | Check code formatting - **NO AUTO-FIX** |
| `make ci` | Run full CI pipeline (check-only mode) |

### Workflow Management
| Command | Description |
|---------|-------------|
| `make workflow-status` | Check GitHub workflow status |
| `make check-workflows` | Analyze workflow failures |
| `make auto-fix` | Automatically fix common issues |
| `make auto-fix-push` | Fix issues and push changes |

### Template Management
| Command | Description |
|---------|-------------|
| `make setup-template` | Interactive template setup |
| `make setup-template-clean` | Setup with example removal |

## 🔄 Development vs CI Workflow

This template separates **development** (auto-fix) and **CI** (check-only) workflows:

### Development Mode (Auto-fix)
```bash
# Automatically fix formatting and imports
make format          # Fixes code style issues
make lint            # Reports linting issues
make type-check      # Reports type issues
```

### CI Mode (Check-only)
```bash
# Check without modifying files (GitHub CI behavior)
make format-check    # Fails if formatting is needed
make ci              # Runs all checks in check-only mode
```

**Why separate modes?**
- **Development**: Helps you by auto-fixing issues as you work
- **CI**: Ensures code quality without modifying files in version control
- **Consistency**: Your local `make ci` matches exactly what GitHub CI runs

## 🔧 Configuration Details

### Code Formatting (Black)
- **Line Length**: 88 characters
- **Target Version**: Python 3.11+
- **String Normalization**: Enabled
- **Magic Trailing Comma**: Enabled

### Import Sorting (isort)
- **Profile**: Black compatibility
- **Line Length**: 88 characters
- **Multi-line Output**: Mode 3 (Vertical Hanging Indent)
- **Force Single Line**: False

### Linting (flake8)
- **Max Line Length**: 88 characters
- **Ignored Errors**: E203 (whitespace before ':'), W503 (line break before binary operator)
- **Excluded Directories**: .git, __pycache__, .venv, build, dist

### Type Checking (mypy)
- **Strict Mode**: Enabled
- **Disallow Untyped Defs**: True
- **Warn Return Any**: True
- **No Implicit Optional**: True

### Testing (pytest)
- **Coverage Target**: 80%+
- **Test Discovery**: Automatic
- **Reports**: HTML + Terminal
- **Strict Config**: Enabled

## 📚 Documentation for AI Context

This template includes comprehensive documentation designed to provide AI models with complete context:

### Key Documentation Files
- **README.md**: This file - comprehensive project overview
- **TEMPLATE_SETUP.md**: Template usage and customization guide
- **docs/AI_CONTEXT.md**: Detailed AI development context
- **docs/DEVELOPMENT_WORKFLOW.md**: Development process and workflows
- **docs/WORKFLOW_MONITORING.md**: Automated workflow monitoring

### AI-Friendly Features
- **Complete Type Annotations**: Every function and class has full type hints
- **Numpy-Style Docstrings**: Structured documentation with examples
- **Clean Architecture**: Clear separation of concerns and patterns
- **Comprehensive Examples**: Working code examples for AI to learn from

## 🚀 Using as a Template

### Creating a New Project
1. **Use GitHub Template**: Click "Use this template" on GitHub
2. **Or Clone Directly**: `git clone https://github.com/mengerj/AI-dev-py-template.git`
3. **Run Template Setup**: `make setup-template`
4. **Start Development**: `make test-watch`

### Customization
The template includes an interactive setup script that:
- Updates project metadata
- Customizes package names
- Removes or keeps example code
- Configures development environment

See `TEMPLATE_SETUP.md` for detailed instructions.

## 🤝 Contributing

Contributions are welcome! Please read the development workflow documentation and ensure all quality checks pass:

```bash
# Before submitting changes
make ci
make workflow-status
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Optimized for [Cursor](https://cursor.sh/) AI IDE
- Compatible with GitHub Copilot and other AI assistants
- Built with modern Python development best practices
- Inspired by the Python community's quality standards

---

**Built with ❤️ for the Cursor AI community**
