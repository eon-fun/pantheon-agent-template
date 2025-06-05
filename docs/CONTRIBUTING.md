# Contributing to PanthEON Agent Template

Thank you for your interest in contributing to PanthEON Agent Template!

## GitHub Flow

We use GitHub Flow for our development process:

1. **Create a branch** from `main` for your feature or fix
2. **Make changes** and commit them with clear messages
3. **Open a Pull Request** to merge your branch into `main`
4. **Code review** - at least one maintainer must approve
5. **Merge** once all checks pass and approval is received

## Getting Started

1. Fork the repository
2. Clone your fork
3. Create a new branch for your feature
4. Make your changes
5. Submit a pull request

## Development Setup

```bash
# Clone the repository
git clone https://github.com/your-username/pantheon-agent-template.git
cd pantheon-agent-template

# For agent development
cd example-agent  # or your agent directory

# Install dependencies
poetry install --with dev

# Install pre-commit hooks
poetry run pre-commit install

# Run tests
poetry run pytest

# Run linting
poetry run ruff check .

# Run type checking
poetry run mypy .
```
## Code Style

- Follow PEP 8
- Use type hints where possible
- Write descriptive commit messages
- Add tests for new features
- Keep line length to 88 characters (configured in Ruff)
- Use meaningful variable and function names

## Commit Messages

We follow conventional commit format:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, semicolons, etc)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

Example: `feat: add support for custom agent configurations`

## Pull Request Process

1. Update the README.md with details of changes if needed
2. Update the CHANGELOG.md with your changes
3. Ensure all tests pass and linting is clean
4. Update documentation if you're changing functionality
5. The PR will be merged once you have the sign-off of at least one maintainer

## Testing

- Write tests for new features
- Ensure all existing tests pass
- Aim for good test coverage
- Use pytest for testing

## Code Review

All submissions require review. We use GitHub pull requests for this purpose. Consult [GitHub Help](https://help.github.com/articles/about-pull-requests/) for more information.

## Questions?

Feel free to open an issue or start a discussion if you have questions!
