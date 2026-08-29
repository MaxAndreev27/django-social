# Security Policy

## Supported Versions

We release patches for security vulnerabilities for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.x     | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via email to security@example.com. Please include the following details in your report:

- Type of issue (e.g. buffer overflow, SQL injection, cross-site scripting, etc.)
- Path of the affected source code
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit the vulnerability

We will endeavor to respond to your report within 48 hours, and will work with you to verify and address the vulnerability.

## Security Updates

We will release security updates for:

- Critical vulnerabilities (CVSS 9.0+)
- High severity vulnerabilities (CVSS 7.0-8.9) affecting data security
- Medium severity vulnerabilities (CVSS 4.0-6.9) with active exploits

Security updates will be released as patch versions and users will be notified through:

- GitHub Security Advisories
- Release notes
- Email notifications to registered users (if applicable)

## Best Practices

When using Django Social, please follow these security best practices:

- Keep your Django and Python versions up to date
- Use strong, unique passwords
- Enable two-factor authentication where available
- Run security scanning tools regularly
- Report any security issues responsibly
- Review security advisories regularly

## Security Headers

We recommend using the following security headers in your production environment:

- Content-Security-Policy
- X-Content-Type-Options
- X-Frame-Options
- X-XSS-Protection
- Strict-Transport-Security

## Dependency Management

We use automated tools to scan dependencies for known vulnerabilities and update them regularly. All pull requests are checked for security issues before merging.

## Contact

For security inquiries or to report a vulnerability, please contact:

- Email: security@example.com

Thank you for helping keep Django Social and our users safe!
