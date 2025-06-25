# x86-64 Assembly Calculator

## Overview

This project is a simple command-line calculator written in x86-64 assembly for Linux. It accepts an arithmetic operator and two integer arguments, performs the specified operation, and prints the result. The supported operations are addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`). The calculator gracefully handles invalid operations and division by zero by printing appropriate error messages.

---

## Features

- Supports basic arithmetic operations: `+`, `-`, `*`, `/`
- Converts string arguments to integers using `atol`
- Handles divide-by-zero with an error message
- Prints "Unknown operation" for unsupported operators
- Works on Linux x86-64 systems
- Detects whether to compile with `-no-pie` flag for compatibility

---

## Requirements

- GCC compiler (`gcc`)
- GNU Make (`make`)
- Linux x86-64 environment

---

## Files

- `calculator.s` — Assembly source code implementing the calculator logic
- `Makefile` — Build instructions and environment detection
- `README.md` — This documentation file

---

## Build Instructions

To build the calculator executable, run:

```bash
make
```

## Usage
```bash
./calculator <operator> <operand1> <operand2>
```
<operator> — One of: +, -, *, /

<operand1> — First integer operand (string will be converted)

<operand2> — Second integer operand (string will be converted)

## Other
This was made and implemented in late 2023