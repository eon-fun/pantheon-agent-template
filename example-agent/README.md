# This is an Example agent

## Installing & Running Pre-commit

This repository uses pre-commit hooks to maintain code quality. Pre-commit automatically runs linting, formatting, and type checking before each commit.

### Installation

1. Install dependencies including dev dependencies:
   ```bash
   poetry install --with dev
   ```

2. Install the pre-commit hooks:
   ```bash
   poetry run pre-commit install
   ```

### Usage

Pre-commit hooks will run automatically on each commit. To manually run all checks:

```bash
poetry run pre-commit run --all-files
```

### What gets checked

- **YAML validation**: Ensures all YAML files are valid
- **File formatting**: Fixes trailing whitespace and missing newlines
- **Merge conflicts**: Checks for unresolved merge conflicts
- **Large files**: Prevents accidentally committing large files
- **Code formatting**: Uses Ruff to format Python code
- **Linting**: Uses Ruff for comprehensive Python linting
- **Type checking**: Uses MyPy for static type analysis

### Configuration

- Pre-commit configuration: `.pre-commit-config.yaml`
- Ruff configuration: `pyproject.toml` (sections `[tool.ruff]` and `[tool.ruff.lint]`)
- MyPy configuration: `pyproject.toml` (section `[tool.mypy]`)
