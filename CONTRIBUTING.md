# Contributing to Django Social

First off, thank you for considering contributing to Django Social! It's people like you that make Django Social such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps which reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed after following the steps**
- **Explain which behavior you expected to see instead and why**
- **Include screenshots and animated GIFs if possible**
- **Include your environment details** (OS, Python version, Django version, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a step-by-step description of the suggested enhancement**
- **Provide specific examples to demonstrate the steps**
- **Describe the current behavior and the expected behavior**
- **Explain why this enhancement would be useful**

### Pull Requests

- Fill in the required template
- Follow the Python and Django styleguides
- Include appropriate test cases
- Update documentation as needed
- End all files with a newline

## Styleguides

### Python Styleguide

All Python code should follow [PEP 8](https://www.python.org/dev/peps/pep-0008/).

- Use 4 spaces for indentation
- Use meaningful variable names
- Keep lines under 79 characters where possible
- Write docstrings for all public modules, functions, classes, and methods

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line
- Consider starting the commit message with an applicable emoji:
  - 🎨 when improving the format/structure of the code
  - 🚀 when improving performance
  - 📝 when writing docs
  - 🐛 when fixing a bug
  - ✅ when adding tests
  - 🔒 when dealing with security
  - ⬆️ when upgrading dependencies
  - ⬇️ when downgrading dependencies

### Documentation Styleguide

- Use Markdown
- Reference methods and classes in backticks: \`SomeClass\` or \`some_method()\`
- Use headings to organize content
- Include code examples where appropriate

## Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/django-social.git`
3. Create a virtual environment: `python -m venv venv`
4. Activate it: `source venv/bin/activate` (on Windows: `venv\Scripts\activate`)
5. Install dependencies: `pip install -r requirements.txt`
6. Create a new branch: `git checkout -b my-feature-branch`
7. Make your changes
8. Run tests: `python manage.py test`
9. Push to your fork and create a Pull Request

## Testing

- Write tests for new features
- Ensure all tests pass before submitting a PR
- Aim for good code coverage
- Run: `python manage.py test` to run the test suite

## License

By contributing, you agree that your contributions will be licensed under its MIT License.

## Additional Notes

### Issue and Pull Request Labels

This section lists the labels we use to help organize and categorize issues and pull requests.

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Improvements or additions to documentation
- `good first issue` - Good for newcomers
- `help wanted` - Extra attention is needed
- `question` - Further information is requested
- `wontfix` - This will not be worked on

## Attribution

This contribution guide is adapted from the [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md) contribution guidelines.
