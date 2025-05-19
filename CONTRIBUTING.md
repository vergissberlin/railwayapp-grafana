# Contributing Guidelines for Railway Grafana Template

Thank you for your interest in contributing to this project! These guidelines will help you contribute effectively.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/railwayapp-grafana.git
   cd railwayapp-grafana
   ```
3. Create a new branch:
   ```bash
   git checkout -b feature/your-feature
   ```

## Development Environment

1. Copy the `.env.example` file:
   ```bash
   cp .env.example .env
   ```
2. Adjust the values in the `.env` file
3. Start the development environment:
   ```bash
   docker-compose up -d
   ```

## Pull Request Guidelines

1. Ensure your code follows the existing style
2. Add tests when implementing new features
3. Update documentation when necessary
4. Describe your changes in the pull request

## Commit Messages

Use meaningful commit messages. A good format is:

```
feat: Add new feature
fix: Fix bug in X
docs: Update documentation
style: Improve code formatting
refactor: Restructure code
```

## Code Style

- Use meaningful variable names
- Comment complex logic
- Keep functions short and focused
- Follow Docker best practices

## Testing

1. Ensure all tests pass successfully
2. Add new tests for new features
3. Test your changes locally before committing

## Documentation

- Update README.md for relevant changes
- Document new features
- Add comments to complex code

## Questions and Support

For questions or issues:
1. Check the existing documentation
2. Create an issue in the GitHub repository
3. Describe the problem in detail

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

Thank you for your contributions! 