# Pantheon Agent Template

This is a template repository for creating Pantheon agents with built-in code quality tools and CI/CD workflows.

## Project Structure

```
pantheon-agent-template/
├── example-agent/           # Example agent implementation
│   ├── src/                # Agent source code
│   ├── pyproject.toml      # Poetry configuration and tool settings
│   ├── .pre-commit-config.yaml  # Pre-commit hooks configuration
│   └── README.md           # Agent-specific documentation
├── .github/workflows/      # GitHub Actions CI/CD workflows
├── docs/                   # Documentation
└── docker-compose.yml      # Docker setup
```

## Quick Start

### 1. Setup Agent Development Environment

Navigate to the agent directory:

```bash
cd example-agent
```

Install dependencies:

```bash
poetry install --with dev
```

Install pre-commit hooks:

```bash
poetry run pre-commit install
```

### 2. Code Quality Tools

This template includes pre-configured code quality tools:

- **Ruff**: Fast Python linter and formatter (replaces black, flake8, isort)
- **MyPy**: Static type checker
- **Pre-commit**: Automated code quality checks before commits

### 3. Running Quality Checks

Run all pre-commit checks manually:

```bash
cd example-agent
poetry run pre-commit run --all-files
```

### 4. Development Workflow

1. Make changes to agent code
2. Pre-commit hooks automatically run on `git commit`
3. CI/CD pipeline runs on push/pull request
4. All checks must pass for merge approval

## Agent Development

### Installing & Running Pre-commit

Each agent in this repository uses pre-commit hooks for code quality:

1. **Installation**:

   ```bash
   cd example-agent  # or your agent directory
   poetry install --with dev
   poetry run pre-commit install
   ```
2. **Usage**:

   ```bash
   # Manual run
   poetry run pre-commit run --all-files

   # Automatic on commit
   git commit -m "Your changes"
   ```
3. **What gets checked**:

   - **YAML validation**: Ensures all YAML files are valid
   - **File formatting**: Fixes trailing whitespace and missing newlines
   - **Merge conflicts**: Checks for unresolved merge conflicts
   - **Large files**: Prevents accidentally committing large files
   - **Code formatting**: Uses Ruff to format Python code
   - **Linting**: Uses Ruff for comprehensive Python linting
   - **Type checking**: Uses MyPy for static type analysis

### Configuration Files

- **Pre-commit**: `example-agent/.pre-commit-config.yaml`
- **Ruff**: `example-agent/pyproject.toml` (sections `[tool.ruff]` and `[tool.ruff.lint]`)
- **MyPy**: `example-agent/pyproject.toml` (section `[tool.mypy]`)

## CI/CD Pipeline

The repository includes GitHub Actions workflows that:

- Run pre-commit checks on every pull request
- Ensure code quality standards are met
- Block merges if any checks fail
- Cache dependencies for faster builds

## Docker Support

Build and run the agent using Docker:

```bash
docker-compose up --build
```

## Contributing

1. Create a feature branch from `main`
2. Make your changes
3. Ensure all pre-commit checks pass
4. Create a pull request
5. All CI checks must pass for merge approval
