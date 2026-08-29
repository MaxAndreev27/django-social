# Django Social 📸

A modern, feature-rich social media platform built with Django, Python, and cutting-edge web technologies. Share images, connect with other users, and discover trending content in a beautiful, responsive interface.

![Django](https://img.shields.io/badge/Django-5.1.3-darkgreen)
![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Community Standards](https://img.shields.io/badge/Community-Standards%20100%25-brightgreen)

## 🌟 Features

- **User Authentication** - Secure registration, login, and password management
- **Social Authentication** - OAuth2 integration with popular platforms
- **Image Sharing** - Upload, manage, and share images seamlessly
- **User Profiles** - Customizable profiles with follow/unfollow functionality
- **Likes & Interactions** - Like images and track user activity in real-time
- **Image Ranking** - Trending system based on popularity and engagement
- **Bookmarklet** - Quick browser extension for easy image sharing
- **Responsive Design** - Works perfectly on desktop, tablet, and mobile
- **Admin Dashboard** - Full Django admin interface for content management
- **Docker Support** - Ready-to-deploy containerized application

## 🚀 Quick Start

### Prerequisites

- Python 3.9+
- PostgreSQL (recommended) or SQLite
- pip and virtualenv

### Installation

```bash
# Clone the repository
git clone https://github.com/MaxAndreev27/django-social.git
cd django-social

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Create superuser
python manage.py createsuperuser

# Run development server
python manage.py runserver
```

Visit `http://localhost:8000` and start using Django Social!

### Docker Deployment

```bash
docker-compose up -d
```

## 📚 Documentation

- [Contributing Guide](CONTRIBUTING.md) - How to contribute
- [Code of Conduct](CODE_OF_CONDUCT.md) - Community guidelines
- [Security Policy](SECURITY.md) - Reporting vulnerabilities
- [Deployment Guide](DEPLOYMENT.md) - Production setup
- [Testing Guide](TESTING.md) - Running tests
- [FAQ](FAQ.md) - Frequently asked questions
- [Roadmap](ROADMAP.md) - Planned features

## 🛠️ Tech Stack

- **Backend**: Django 5.1.3, Django Debug Toolbar
- **Database**: PostgreSQL (production), SQLite (development)
- **Authentication**: Django Auth, Social Auth Core
- **Image Processing**: Pillow, Easy Thumbnails
- **Caching**: Redis
- **Web Server**: Gunicorn, Nginx
- **Frontend**: HTML, CSS, JavaScript

## 📊 Project Structure

```
django-social/
├── manage.py                    # Django management script
├── requirements.txt             # Python dependencies
├── Dockerfile                   # Container configuration
├── docker-compose.yml          # Multi-container setup
├── fly.toml                    # Fly.io deployment config
│
├── config/                     # Project configuration
│   ├── settings.py            # Django settings
│   ├── urls.py                # URL routing
│   ├── wsgi.py                # WSGI application
│   └── asgi.py                # ASGI application
│
├── account/                    # User authentication & profiles
│   ├── models.py              # User profile models
│   ├── views.py               # Authentication views
│   ├── forms.py               # Registration & profile forms
│   ├── urls.py                # Account URLs
│   ├── authentication.py       # Social auth backend
│   └── templates/account/     # Auth templates
│
├── images/                     # Image sharing & management
│   ├── models.py              # Image models
│   ├── views.py               # Image views
│   ├── forms.py               # Image forms
│   ├── urls.py                # Image URLs
│   ├── signals.py             # Image signal handlers
│   └── templates/images/      # Image templates
│
├── actions/                    # User activity tracking
│   ├── models.py              # Activity models
│   ├── views.py               # Activity views
│   ├── utils.py               # Utility functions
│   └── migrations/            # Database migrations
│
├── static/                     # Static files
│   ├── css/                   # Stylesheets
│   ├── js/                    # JavaScript files
│   └── images/                # Static images
│
├── templates/                  # HTML templates
│   ├── base.html              # Base template
│   ├── account/               # Account templates
│   ├── images/                # Image templates
│   ├── actions/               # Action templates
│   └── registration/          # Registration templates
│
├── media/                      # User-uploaded files
│   ├── images/                # User images
│   └── users/                 # User avatars
│
├── .github/                    # GitHub configuration
│   ├── workflows/             # CI/CD workflows
│   ├── ISSUE_TEMPLATE/        # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
│
├── docs/                       # Documentation
│   ├── CONTRIBUTING.md        # Contribution guide
│   ├── DEPLOYMENT.md          # Deployment guide
│   ├── TESTING.md             # Testing guide
│   ├── CODE_OF_CONDUCT.md     # Code of conduct
│   └── SECURITY.md            # Security policy
│
└── db.sqlite3                 # Development database
```

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the project root:

```env
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1

# Database
DB_ENGINE=django.db.backends.postgresql
DB_NAME=django_social
DB_USER=postgres
DB_PASSWORD=password

# Email
EMAIL_BACKEND=django.core.mail.backends.console.EmailBackend

# Social Auth (Optional)
SOCIAL_AUTH_GITHUB_KEY=your-github-key
SOCIAL_AUTH_GITHUB_SECRET=your-github-secret
```

## 🧪 Running Tests

```bash
# Run all tests
python manage.py test

# Run tests with coverage
coverage run --source='.' manage.py test
coverage report

# Run specific app tests
python manage.py test account
python manage.py test images
```

## 🚀 Deployment

### Deploy to Fly.io

```bash
flyctl launch
flyctl deploy
```

### Deploy to Heroku

```bash
heroku create your-app-name
git push heroku main
```

For detailed deployment instructions, see [DEPLOYMENT.md](DEPLOYMENT.md).

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on:

- How to report bugs
- How to suggest features
- How to submit pull requests
- Development setup

## 📋 Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## 🔒 Security

If you discover a security vulnerability, please email security@example.com instead of using the issue tracker. See [SECURITY.md](SECURITY.md) for details.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✨ Acknowledgments

- Built with [Django](https://www.djangoproject.com/) - The Web framework for perfectionists
- Image processing with [Pillow](https://python-pillow.org/)
- Inspired by modern social media platforms
- Thanks to all contributors and the community

## 📞 Support

- 💬 [Discussions](https://github.com/MaxAndreev27/django-social/discussions) - Ask questions and share ideas
- 🐛 [Issues](https://github.com/MaxAndreev27/django-social/issues) - Report bugs
- 📚 [Documentation](SUPPORT.md) - Help and resources
- ❓ [FAQ](FAQ.md) - Frequently asked questions

## 🗺️ Roadmap

See [ROADMAP.md](ROADMAP.md) for planned features and future improvements.

---

**Made with ❤️ by [Max Andreev](https://github.com/MaxAndreev27)**
