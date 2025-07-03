# 🤖 AI-Assisted Development Workflow

This document outlines the comprehensive development workflow for AI-assisted Python development using this template.

## 📋 Overview

The AI-dev-py-template provides a structured workflow optimized for AI-assisted development tools like Cursor, GitHub Copilot, and other AI coding assistants. The workflow emphasizes:

- **AI-Friendly Code Structure**: Comprehensive type hints and numpy-style docstrings
- **Test-Driven Development**: AI-generated tests with human oversight
- **Automated Quality Assurance**: Continuous integration and automated fixes
- **Clean Architecture**: Patterns that AI can understand and extend

## 🚀 Initial Setup

### 1. Repository Setup

```bash
# Clone the template
git clone https://github.com/mengerj/AI-dev-py-template.git
cd AI-dev-py-template

# Set up development environment
make setup-env
source venv/bin/activate
make install-dev

# Verify setup
make ci
```

### 2. Template Customization

```bash
# Interactive setup for new projects
make setup-template

# Or setup with clean slate (removes examples)
make setup-template-clean
```

## 🔄 Development Cycle

### Phase 1: Planning and Issue Creation

#### 1.1 Create Detailed Issues

Use AI to help create comprehensive issues:

```bash
# Create issue with AI assistance
make issue

# Example AI prompt:
# "Create a detailed issue for implementing user authentication system with:
# - Email/password login
# - JWT token management
# - Password hashing with bcrypt
# - Session management
# - Email verification
# Include acceptance criteria and technical requirements"
```

#### 1.2 Branch Creation

```bash
# Create feature branch from GitHub issue
make branch-from-issue
```

### Phase 2: Test-Driven Development

#### 2.1 Start Test Watching

```bash
# Keep tests running during development
make test-watch
```

#### 2.2 AI-Generated Tests

Use AI to generate comprehensive tests with numpy-style docstrings:

```python
# Example AI prompt:
# "Write comprehensive tests for email validation with numpy-style docstrings:
# - Valid email formats
# - Invalid email formats
# - Edge cases (empty, None, special characters)
# - Parametrized tests with test data
# - Clear docstrings with Parameters, Returns, Examples sections"

# Generated test structure:
def test_email_validation_valid_emails(self, valid_email: str) -> None:
    """
    Test email validation with valid email addresses.

    Parameters
    ----------
    valid_email : str
        Valid email address to test

    Examples
    --------
    >>> validator = EmailValidator()
    >>> validator.is_valid("user@example.com")
    True
    """
    validator = EmailValidator()
    assert validator.is_valid(valid_email) is True
```

#### 2.3 Test Categories

Create tests for different aspects:

```python
# Unit tests for individual functions
class TestEmailValidator:
    """Unit tests for EmailValidator class."""

    def test_valid_email_formats(self) -> None:
        """Test various valid email formats."""
        pass

    def test_invalid_email_formats(self) -> None:
        """Test various invalid email formats."""
        pass

# Integration tests for workflows
class TestUserAuthenticationFlow:
    """Integration tests for user authentication."""

    def test_complete_signup_flow(self) -> None:
        """Test complete user signup process."""
        pass

    def test_complete_login_flow(self) -> None:
        """Test complete user login process."""
        pass

# Performance tests for critical paths
class TestPerformanceMetrics:
    """Performance tests for critical operations."""

    def test_password_hashing_performance(self) -> None:
        """Test password hashing performance."""
        pass
```

### Phase 3: AI-Assisted Implementation

#### 3.1 Implementation with AI

Use AI to implement functionality following established patterns:

```python
# Example AI prompt:
# "Implement EmailValidator class following clean architecture:
# - Use comprehensive type hints
# - Include numpy-style docstrings
# - Handle edge cases properly
# - Follow single responsibility principle
# - Include proper error handling"

class EmailValidator:
    """
    Validate email addresses using comprehensive rules.

    This class provides email validation functionality with support for
    various email formats and comprehensive error handling.

    Attributes
    ----------
    _email_regex : re.Pattern
        Compiled regex pattern for email validation

    Examples
    --------
    >>> validator = EmailValidator()
    >>> validator.is_valid("user@example.com")
    True
    >>> validator.is_valid("invalid-email")
    False
    """

    def __init__(self) -> None:
        """Initialize email validator with regex pattern."""
        self._email_regex = re.compile(
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
        )

    def is_valid(self, email: str) -> bool:
        """
        Validate email address format.

        Parameters
        ----------
        email : str
            Email address to validate

        Returns
        -------
        bool
            True if email is valid, False otherwise

        Examples
        --------
        >>> validator = EmailValidator()
        >>> validator.is_valid("user@example.com")
        True
        >>> validator.is_valid("invalid.email")
        False
        """
        if not email or not isinstance(email, str):
            return False
        return bool(self._email_regex.match(email))
```

#### 3.2 AI-Friendly Patterns

Follow these patterns for better AI understanding:

```python
# 1. Comprehensive Type Hints
from typing import Dict, List, Optional, Union, Any, Tuple
from pathlib import Path
from datetime import datetime

def process_user_data(
    user_data: Dict[str, Any],
    validation_rules: List[str],
    output_format: str = "json",
    include_metadata: bool = True
) -> Tuple[Dict[str, Any], List[str]]:
    """
    Process user data with validation and formatting.

    Parameters
    ----------
    user_data : Dict[str, Any]
        Raw user data dictionary
    validation_rules : List[str]
        List of validation rules to apply
    output_format : str, default="json"
        Output format ("json", "xml", "yaml")
    include_metadata : bool, default=True
        Whether to include processing metadata

    Returns
    -------
    Tuple[Dict[str, Any], List[str]]
        Processed data and list of validation errors

    Examples
    --------
    >>> data = {"name": "John", "email": "john@example.com"}
    >>> rules = ["email_format", "name_length"]
    >>> result, errors = process_user_data(data, rules)
    >>> len(errors)
    0
    """
    # Implementation here
    pass

# 2. Immutable Operations
def calculate_user_score(
    user_metrics: Dict[str, float],
    weights: Dict[str, float]
) -> float:
    """
    Calculate user score without modifying input data.

    Parameters
    ----------
    user_metrics : Dict[str, float]
        User performance metrics
    weights : Dict[str, float]
        Weights for each metric

    Returns
    -------
    float
        Calculated weighted score
    """
    # Create new data instead of modifying input
    weighted_scores = {
        metric: value * weights.get(metric, 1.0)
        for metric, value in user_metrics.items()
    }
    return sum(weighted_scores.values())

# 3. Proper Error Handling
class UserDataError(Exception):
    """Base exception for user data operations."""
    pass

class ValidationError(UserDataError):
    """Raised when user data validation fails."""
    pass

def validate_user_data(data: Dict[str, Any]) -> None:
    """
    Validate user data dictionary.

    Parameters
    ----------
    data : Dict[str, Any]
        User data to validate

    Raises
    ------
    ValidationError
        If data validation fails

    Examples
    --------
    >>> validate_user_data({"name": "John", "email": "john@example.com"})
    >>> validate_user_data({"name": ""})
    Traceback (most recent call last):
        ...
    ValidationError: Name cannot be empty
    """
    if not data.get("name", "").strip():
        raise ValidationError("Name cannot be empty")

    email = data.get("email", "")
    if not email or "@" not in email:
        raise ValidationError("Valid email address required")
```

### Phase 4: Quality Assurance

#### 4.1 Local Quality Checks

```bash
# Run all quality checks
make ci

# Individual checks
make format      # Black + isort formatting
make lint        # flake8 linting
make type-check  # mypy type checking
make test        # pytest with coverage
make security-check  # bandit security scanning
```

#### 4.2 Automated Fixes

```bash
# Automatically fix common issues
make auto-fix

# Fix and push changes
make auto-fix-push
```

#### 4.3 Continuous Integration

The workflow includes automated CI/CD:

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.11, 3.12]

    steps:
    - uses: actions/checkout@v3
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v4
      with:
        python-version: ${{ matrix.python-version }}

    - name: Install dependencies
      run: |
        make setup-env
        source venv/bin/activate
        make install-dev

    - name: Run quality checks
      run: |
        source venv/bin/activate
        make ci
```

### Phase 5: Documentation and Review

#### 5.1 AI-Generated Documentation

Use AI to enhance documentation:

```python
# Example AI prompt:
# "Add comprehensive numpy-style docstring to this function with:
# - Detailed parameter descriptions
# - Return value documentation
# - Examples section with realistic usage
# - Raises section for exceptions
# - Notes section for important details"

def authenticate_user(
    email: str,
    password: str,
    remember_me: bool = False
) -> Tuple[Optional[str], Dict[str, Any]]:
    """
    Authenticate user with email and password.

    This function handles user authentication by validating credentials
    against the database and generating appropriate tokens for session
    management.

    Parameters
    ----------
    email : str
        User's email address
    password : str
        User's plaintext password
    remember_me : bool, default=False
        Whether to create a persistent session

    Returns
    -------
    Tuple[Optional[str], Dict[str, Any]]
        Authentication token (if successful) and user data dictionary

    Raises
    ------
    AuthenticationError
        If credentials are invalid
    DatabaseError
        If database connection fails

    Examples
    --------
    >>> token, user_data = authenticate_user("john@example.com", "password123")
    >>> token is not None
    True
    >>> user_data["email"]
    'john@example.com'

    >>> authenticate_user("invalid@example.com", "wrong_password")
    Traceback (most recent call last):
        ...
    AuthenticationError: Invalid credentials

    Notes
    -----
    Passwords are hashed using bcrypt for security. Sessions are managed
    using JWT tokens with configurable expiration times.
    """
    # Implementation here
    pass
```

#### 5.2 Code Review with AI

Use AI to review code before creating pull requests:

```bash
# AI prompts for code review:
# "Review this code for potential issues:
# - Type safety and hint completeness
# - Error handling and edge cases
# - Performance considerations
# - Security vulnerabilities
# - Code organization and readability
# - Test coverage completeness"
```

### Phase 6: Deployment and Monitoring

#### 6.1 Pull Request Creation

```bash
# Create pull request with AI-generated description
make pr

# AI will help generate:
# - Comprehensive PR description
# - Changes summary
# - Testing notes
# - Deployment considerations
```

#### 6.2 Workflow Monitoring

```bash
# Monitor workflow status
make workflow-status

# Check for failures and get suggestions
make check-workflows

# Auto-fix common workflow issues
make auto-fix-workflow
```

## 🔧 AI Development Best Practices

### 1. Type Hints Strategy

```python
# Use specific types instead of generic ones
from typing import Dict, List, Optional, Union, Literal, TypeVar, Generic

# Good: Specific types
UserID = str
UserData = Dict[str, Union[str, int, bool]]
ValidationResult = Tuple[bool, List[str]]

# Better: Generic types for reusability
T = TypeVar('T')
class Repository(Generic[T]):
    def get(self, id: str) -> Optional[T]:
        pass

    def save(self, item: T) -> bool:
        pass

# Best: Literal types for constrained values
OutputFormat = Literal["json", "xml", "yaml"]
LogLevel = Literal["debug", "info", "warning", "error", "critical"]
```

### 2. Docstring Templates

```python
# Function template
def function_name(param1: Type1, param2: Type2 = default) -> ReturnType:
    """
    Brief description of function purpose.

    Detailed description of what the function does, how it works,
    and any important considerations.

    Parameters
    ----------
    param1 : Type1
        Description of first parameter
    param2 : Type2, default=default
        Description of second parameter with default value

    Returns
    -------
    ReturnType
        Description of return value

    Raises
    ------
    ExceptionType
        Description of when this exception is raised

    Examples
    --------
    >>> result = function_name(arg1, arg2)
    >>> result.some_attribute
    expected_value

    Notes
    -----
    Any additional notes or considerations.
    """
    pass

# Class template
class ClassName:
    """
    Brief description of class purpose.

    Detailed description of what the class does, its responsibilities,
    and how it fits into the larger system.

    Parameters
    ----------
    param1 : Type1
        Description of constructor parameter

    Attributes
    ----------
    attr1 : Type1
        Description of instance attribute
    attr2 : Type2
        Description of another attribute

    Examples
    --------
    >>> instance = ClassName(param1_value)
    >>> instance.method()
    expected_result
    """

    def __init__(self, param1: Type1) -> None:
        """Initialize class instance."""
        self.attr1 = param1
        self.attr2 = self._calculate_attr2()
```

### 3. Testing Strategies

```python
# Test organization
class TestClassName:
    """Test suite for ClassName."""

    def test_initialization(self) -> None:
        """Test class initialization."""
        pass

    def test_method_happy_path(self) -> None:
        """Test method with valid inputs."""
        pass

    def test_method_edge_cases(self) -> None:
        """Test method with edge case inputs."""
        pass

    def test_method_error_conditions(self) -> None:
        """Test method error handling."""
        pass

# Parametrized tests
@pytest.mark.parametrize("input_data,expected", [
    ({"name": "John", "age": 30}, True),
    ({"name": "", "age": 30}, False),
    ({"name": "John", "age": -1}, False),
    ({}, False),
])
def test_data_validation(input_data: Dict[str, Any], expected: bool) -> None:
    """
    Test data validation with various inputs.

    Parameters
    ----------
    input_data : Dict[str, Any]
        Input data to validate
    expected : bool
        Expected validation result
    """
    validator = DataValidator()
    result = validator.is_valid(input_data)
    assert result == expected
```

## 🚀 Conclusion

This workflow provides a comprehensive framework for AI-assisted Python development. The key benefits include:

- **Accelerated Development**: AI assistance for code generation and testing
- **Consistent Quality**: Automated quality checks and formatting
- **Better Documentation**: Comprehensive, AI-readable documentation
- **Reduced Errors**: Type checking and comprehensive testing
- **Maintainable Code**: Clean architecture and clear patterns

The workflow is designed to be iterative and flexible, allowing developers to adapt it to their specific needs while maintaining the core principles of AI-assisted development.
