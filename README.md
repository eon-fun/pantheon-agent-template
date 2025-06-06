# Pantheon Agent Template

This is a template repository for creating Pantheon agents with built-in code quality tools and CI/CD workflows.

## Project Structure

```
pantheon-agent-template/
├── src/                # Agent source code
├── pyproject.toml      # Poetry configuration and tool settings
├── .pre-commit-config.yaml  # Pre-commit hooks configuration
├── README.md           # Agent-specific documentation
├── .github/workflows/      # GitHub Actions CI/CD workflows
├── docs/                   # Documentation
└── docker-compose.yml      # Docker setup
```

## Requirements

* Python 3.10+
* [Poetry](https://python-poetry.org/) for dependency management

## Quick Start

### 1. Setup Agent Development Environment

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

- **Pre-commit**: `.pre-commit-config.yaml`
- **Ruff**: `pyproject.toml` (sections `[tool.ruff]` and `[tool.ruff.lint]`)
- **MyPy**: `pyproject.toml` (section `[tool.mypy]`)

## CI/CD Pipeline

The repository includes GitHub Actions workflows that:

- Run pre-commit checks on every pull request
- Ensure code quality standards are met
- Block merges if any checks fail
- Cache dependencies for faster builds
## Docker Support

Build and run the agent using Docker:

```bash
./start_agent.sh
```

## Adding New Agents

To create a new agent from this template:

1. Copy the `example-agent` directory
2. Rename it to your agent name
3. Update `pyproject.toml` with your agent details
4. Install dependencies: `poetry install --with dev`
5. Install pre-commit hooks: `poetry run pre-commit install`
6. Start developing!

## Support

### Getting Help

If you need help or have questions about the PanthEON Agent Template:

- **GitHub Issues**: For bug reports and feature requests, please use our [issue templates](https://github.com/eon-fun/pantheon-agent-template/issues/new/choose)
- **GitHub Discussions**: For general questions and community discussions, visit our [discussions page](https://github.com/eon-fun/pantheon-agent-template/discussions)
- **Documentation**: Check our [contributing guide](docs/CONTRIBUTING.md) for development workflows

### Response Time

We aim to respond to issues and discussions within **48 hours** during business days. Please be patient as our maintainers are volunteers.

### Breaking Changes Policy

We follow semantic versioning and maintain backward compatibility:

- **MAJOR version bumps**: We will maintain backward compatibility for at least **6 months** before removing deprecated features
- **MINOR version bumps**: Only add new features, no breaking changes
- **PATCH version bumps**: Bug fixes and security updates only

All breaking changes will be clearly documented in our [CHANGELOG.md](CHANGELOG.md) and announced in advance.
## Maintainers

This project is maintained by:

- **Technical Lead**: [@golemxiv](https://github.com/golemxiv)
- **Primary Maintainer**: [@k1llzz](https://github.com/k1llzz)
- **Core Maintainer**: [@polkadot21](https://github.com/polkadot21)
- **Infrastructure Maintainer**: [@drobotukhin](https://github.com/drobotukhin)

### Maintainer Responsibilities

- Review and merge pull requests
- Triage and respond to issues
- Release new versions
- Maintain project roadmap and direction

### Becoming a Maintainer

We welcome new maintainers! If you're interested in helping maintain this project:

1. **Contribute regularly**: Submit quality PRs and help with issue triage
2. **Show commitment**: Demonstrate sustained involvement over 3+ months
3. **Express interest**: Reach out to existing maintainers via GitHub Discussions
4. **Onboarding**: Current maintainers will provide access and guidance

### Maintainer Rotation

- Maintainers may step down at any time by notifying the team
- Inactive maintainers (6+ months) will be asked about their continued involvement
- New maintainers require approval from at least 2 existing maintainers

## Contributing

Please see our [contributing guide](docs/CONTRIBUTING.md) for detailed information on:

- Development setup
- Code style guidelines
- Pull request process
- Testing requirements
