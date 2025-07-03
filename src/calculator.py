"""
Calculator module demonstrating clean architecture and AI-friendly development.

This module provides basic arithmetic operations with proper error handling,
comprehensive type hints, and numpy-style docstrings optimized for AI understanding.
"""

from typing import Union

Number = Union[int, float]


class CalculatorError(Exception):
    """Base exception for calculator operations."""

    pass


class DivisionByZeroError(CalculatorError):
    """Raised when attempting to divide by zero."""

    pass


class Calculator:
    """
    A calculator class providing basic arithmetic operations.

    This class demonstrates clean architecture patterns for AI-assisted development:
    - Single responsibility principle
    - Proper error handling with custom exceptions
    - Comprehensive type hints for better AI understanding
    - Numpy-style docstrings with detailed examples
    - Immutable operations (no side effects)

    Examples
    --------
    >>> calc = Calculator()
    >>> calc.add(2, 3)
    5
    >>> calc.divide(10, 0)
    Traceback (most recent call last):
        ...
    DivisionByZeroError: Cannot divide by zero
    """

    def add(self, a: Number, b: Number) -> Number:
        """
        Add two numbers together.

        Parameters
        ----------
        a : Number
            First number to add (int or float)
        b : Number
            Second number to add (int or float)

        Returns
        -------
        Number
            Sum of the two input numbers

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.add(2, 3)
        5
        >>> calc.add(2.5, 1.5)
        4.0
        >>> calc.add(-1, 1)
        0
        """
        return a + b

    def subtract(self, a: Number, b: Number) -> Number:
        """
        Subtract the second number from the first.

        Parameters
        ----------
        a : Number
            Minuend (number to subtract from)
        b : Number
            Subtrahend (number to subtract)

        Returns
        -------
        Number
            Difference between the two numbers (a - b)

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.subtract(5, 3)
        2
        >>> calc.subtract(10.5, 2.5)
        8.0
        >>> calc.subtract(1, 5)
        -4
        """
        return a - b

    def multiply(self, a: Number, b: Number) -> Number:
        """
        Multiply two numbers together.

        Parameters
        ----------
        a : Number
            First factor
        b : Number
            Second factor

        Returns
        -------
        Number
            Product of the two numbers

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.multiply(4, 3)
        12
        >>> calc.multiply(2.5, 4)
        10.0
        >>> calc.multiply(-2, 3)
        -6
        >>> calc.multiply(0, 100)
        0
        """
        return a * b

    def divide(self, a: Number, b: Number) -> float:
        """
        Divide the first number by the second.

        Parameters
        ----------
        a : Number
            Dividend (number to be divided)
        b : Number
            Divisor (number to divide by)

        Returns
        -------
        float
            Quotient of the division operation

        Raises
        ------
        DivisionByZeroError
            If the divisor (b) is zero

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.divide(10, 2)
        5.0
        >>> calc.divide(7, 2)
        3.5
        >>> calc.divide(-10, 2)
        -5.0
        >>> calc.divide(10, 0)
        Traceback (most recent call last):
            ...
        DivisionByZeroError: Cannot divide by zero
        """
        if b == 0:
            raise DivisionByZeroError("Cannot divide by zero")
        return a / b

    def power(self, base: Number, exponent: Number) -> Number:
        """
        Raise a base number to the power of an exponent.

        Parameters
        ----------
        base : Number
            Base number
        exponent : Number
            Exponent (power to raise base to)

        Returns
        -------
        Number
            Result of base raised to the power of exponent

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.power(2, 3)
        8
        >>> calc.power(5, 2)
        25
        >>> calc.power(2, 0)
        1
        >>> calc.power(4, 0.5)
        2.0
        >>> calc.power(2, -1)
        0.5
        """
        return base**exponent

    def modulo(self, a: Number, b: Number) -> Number:
        """
        Calculate the remainder of division between two numbers.

        Parameters
        ----------
        a : Number
            Dividend (number to be divided)
        b : Number
            Divisor (number to divide by)

        Returns
        -------
        Number
            Remainder of the division operation

        Raises
        ------
        DivisionByZeroError
            If the divisor (b) is zero

        Examples
        --------
        >>> calc = Calculator()
        >>> calc.modulo(10, 3)
        1
        >>> calc.modulo(15, 4)
        3
        >>> calc.modulo(8, 2)
        0
        >>> calc.modulo(10, 0)
        Traceback (most recent call last):
            ...
        DivisionByZeroError: Cannot divide by zero
        """
        if b == 0:
            raise DivisionByZeroError("Cannot divide by zero")
        return a % b
