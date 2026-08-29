# FAQ - Frequently Asked Questions

## General Questions

### What is Django Social?

Django Social is an open-source social media platform built with Django, Python, and modern web technologies. It allows users to share images, connect with other users, and discover trending content.

### Who created Django Social?

Django Social was created by [Max Andreev](https://github.com/MaxAndreev27).

### Is Django Social free to use?

Yes! Django Social is completely free and open source under the [MIT License](LICENSE).

### Can I use Django Social commercially?

Yes, you can use Django Social for commercial purposes as long as you comply with the MIT License terms.

### How can I contribute?

Please read our [Contributing Guide](CONTRIBUTING.md) for detailed instructions on how to contribute code, report bugs, and suggest features.

## Technical Questions

### What are the system requirements?

- Python 3.9+
- Django 4.0+
- PostgreSQL 12+ (recommended for production)
- Docker (optional, for containerized deployment)

### How do I install Django Social?

1. Clone the repository: `git clone https://github.com/MaxAndreev27/django-social.git`
2. Create a virtual environment: `python -m venv venv`
3. Activate it: `source venv/bin/activate` (or `venv\Scripts\activate` on Windows)
4. Install dependencies: `pip install -r requirements.txt`
5. Run migrations: `python manage.py migrate`
6. Create a superuser: `python manage.py createsuperuser`
7. Run the development server: `python manage.py runserver`

### Can I use Django Social with Docker?

Yes! A Dockerfile is included in the repository. You can build and run it with Docker Compose.

### What database does Django Social use?

Django Social uses SQLite by default for development. For production, PostgreSQL is recommended.

### How do I deploy Django Social?

Django Social can be deployed to various platforms:

- Heroku
- PythonAnywhere
- AWS
- DigitalOcean
- Fly.io (see Dockerfile and fly.toml)
- Any server that supports Python/Django

### Is there an API?

Django Social uses Django's built-in REST framework. Full API documentation is available in the documentation.

## Security Questions

### Is Django Social secure?

We take security seriously. See our [Security Policy](SECURITY.md) for details.

### How do I report a security vulnerability?

Please see our [Security Policy](SECURITY.md) for responsible disclosure guidelines. Do NOT report security issues in public issues.

### Does Django Social support HTTPS?

Yes, HTTPS is recommended for production deployments and is supported.

### How is user data protected?

- Passwords are hashed using Django's default PBKDF2 algorithm
- Sessions are stored securely
- CSRF protection is enabled
- SQL injection prevention through ORM
- XSS protection via template engine

### Is two-factor authentication (2FA) available?

2FA is planned for version 1.2. In the meantime, use strong passwords and keep your account secure.

## Usage Questions

### How do I create an account?

1. Visit the registration page
2. Enter your username, email, and password
3. Confirm your email (if email verification is enabled)
4. Start using Django Social!

### How do I upload an image?

1. Log in to your account
2. Navigate to "Upload" or click the image upload button
3. Select an image from your computer
4. Add a title and description (optional)
5. Click "Upload"

### Can I delete my account?

Yes, you can delete your account from your profile settings. This will remove all your data permanently.

### How do I report inappropriate content?

Use the report button on the content or contact us at support@example.com.

### Can I export my data?

This feature is planned for a future release. For now, you can use your browser's developer tools or contact us for data export assistance.

## Performance Questions

### How many users can Django Social handle?

Django Social can handle thousands of concurrent users, depending on your infrastructure. Use proper caching, CDN, and database optimization for production deployments.

### How do I improve performance?

- Use a CDN for static and media files
- Enable caching (Redis, Memcached)
- Optimize database queries
- Use a production-grade web server (Gunicorn, uWSGI)
- Enable compression (gzip)
- Minimize images before upload

### Is there a mobile app?

A mobile app is planned for version 1.2. Currently, the web interface is responsive and works on mobile devices.

## Community Questions

### Where can I ask questions?

- [GitHub Discussions](https://github.com/MaxAndreev27/django-social/discussions)
- [Support](SUPPORT.md)
- [Issue Tracker](https://github.com/MaxAndreev27/django-social/issues)

### How can I get involved in the community?

- Contribute code
- Report bugs
- Suggest features
- Help with documentation
- Provide feedback and ideas
- Support other users

### Is there a code of conduct?

Yes! See our [Code of Conduct](CODE_OF_CONDUCT.md).

## Troubleshooting

### I'm getting a "Database connection error"

Make sure PostgreSQL (or your configured database) is running and the connection settings are correct in `settings.py`.

### Images aren't uploading

Check file permissions in the `media/` directory and ensure you have enough disk space.

### Static files aren't loading

Run `python manage.py collectstatic` and ensure your web server is configured to serve static files.

### I'm getting a "CSRF token missing" error

This usually means cookies aren't being set properly. Check your browser settings and ensure you're using the correct domain.

## Getting Help

Can't find an answer? Here are some resources:

1. **[Documentation](README.md)** - Start here
2. **[Support](SUPPORT.md)** - How to get help
3. **[GitHub Issues](https://github.com/MaxAndreev27/django-social/issues)** - Bug reports
4. **[GitHub Discussions](https://github.com/MaxAndreev27/django-social/discussions)** - Questions and ideas
5. **[CONTRIBUTING.md](CONTRIBUTING.md)** - For developers
6. **[CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)** - Community guidelines

---

Last updated: 2026-08-29

Did we miss something? [Open an issue](https://github.com/MaxAndreev27/django-social/issues) to suggest FAQ additions!
