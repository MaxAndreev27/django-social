# Testing Guide

This document provides guidelines for testing Django Social.

## Table of Contents

- [Running Tests](#running-tests)
- [Writing Tests](#writing-tests)
- [Test Coverage](#test-coverage)
- [Continuous Integration](#continuous-integration)
- [Manual Testing](#manual-testing)

## Running Tests

### Prerequisites

```bash
pip install -r requirements.txt
```

### Run All Tests

```bash
python manage.py test
```

### Run Tests for Specific App

```bash
python manage.py test account
python manage.py test images
python manage.py test actions
```

### Run Specific Test Module

```bash
python manage.py test account.tests.test_models
```

### Run Specific Test Case

```bash
python manage.py test account.tests.TestUserModel.test_user_creation
```

### Run Tests with Verbosity

```bash
python manage.py test --verbosity=2
```

### Run Tests with Coverage

```bash
coverage run --source='.' manage.py test
coverage report
coverage html  # Generate HTML coverage report
```

### Run Tests in Parallel

```bash
python manage.py test --parallel
```

## Writing Tests

### Test Structure

Tests should follow this structure:

```python
from django.test import TestCase
from django.contrib.auth.models import User
from .models import Image

class ImageModelTests(TestCase):
    def setUp(self):
        """Set up test data"""
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )

    def tearDown(self):
        """Clean up after tests"""
        self.user.delete()

    def test_image_creation(self):
        """Test that an image can be created"""
        image = Image.objects.create(
            user=self.user,
            title='Test Image'
        )
        self.assertEqual(image.title, 'Test Image')
        self.assertEqual(image.user, self.user)
```

### Testing Best Practices

1. **Use Descriptive Names**: Test names should clearly describe what they test

   ```python
   def test_user_cannot_like_same_image_twice(self):
   ```

2. **One Assertion Per Test**: Keep tests focused on a single behavior

   ```python
   def test_image_title_is_required(self):
       with self.assertRaises(ValidationError):
           Image.objects.create(title='')
   ```

3. **Use setUp and tearDown**: Prepare test data consistently

   ```python
   def setUp(self):
       self.user = User.objects.create_user(username='test')
   ```

4. **Use Fixtures**: For complex test data

   ```python
   class MyTests(TestCase):
       fixtures = ['test_data.json']
   ```

5. **Mock External Services**: Use unittest.mock for API calls

   ```python
   from unittest.mock import patch

   @patch('requests.get')
   def test_external_api(self, mock_get):
       mock_get.return_value.status_code = 200
   ```

### Test Types

#### Unit Tests

Test individual functions and methods in isolation.

```python
def test_calculate_trending_score(self):
    score = calculate_trending_score(likes=100, age_hours=24)
    self.assertGreater(score, 0)
```

#### Integration Tests

Test how multiple components work together.

```python
def test_user_like_image_updates_ranking(self):
    image = Image.objects.create(user=self.user, title='Test')
    old_ranking = image.ranking
    like(self.user, image)
    image.refresh_from_db()
    self.assertNotEqual(image.ranking, old_ranking)
```

#### View Tests

Test Django views and HTTP responses.

```python
def test_image_list_view(self):
    response = self.client.get(reverse('images:list'))
    self.assertEqual(response.status_code, 200)
    self.assertTemplateUsed(response, 'images/list.html')
```

#### Model Tests

Test Django models and their methods.

```python
def test_user_full_name(self):
    user = User.objects.create(first_name='John', last_name='Doe')
    self.assertEqual(user.get_full_name(), 'John Doe')
```

## Test Coverage

### Generate Coverage Report

```bash
coverage run --source='.' manage.py test
coverage report
```

### Acceptable Coverage Levels

- Overall: >= 80%
- Core features: >= 90%
- Critical paths: 100%

### View HTML Coverage Report

```bash
coverage html
open htmlcov/index.html
```

### Coverage Configuration

Create a `.coveragerc` file for custom settings:

```ini
[run]
source = .
omit =
    */migrations/*
    */tests/*
    manage.py

[report]
precision = 2
show_missing = True
skip_covered = False
```

## Continuous Integration

### GitHub Actions

Tests run automatically on:

- Every push to main/develop branches
- Every pull request
- Scheduled weekly runs

See `.github/workflows/tests.yml` for configuration.

### Local Pre-commit Checks

To run tests before committing:

```bash
# Run tests
python manage.py test

# Check code style
flake8 .

# Format code
black .

# Sort imports
isort .
```

## Manual Testing

### Testing Checklist

- [ ] User Registration
  - [ ] Successful registration with valid data
  - [ ] Registration fails with invalid email
  - [ ] Password validation works
  - [ ] Duplicate username/email detection

- [ ] User Login
  - [ ] Login with correct credentials
  - [ ] Login fails with wrong password
  - [ ] Session handling works correctly

- [ ] Image Management
  - [ ] Image upload works
  - [ ] Image deletion works
  - [ ] Image editing works
  - [ ] File size limits enforced

- [ ] Social Features
  - [ ] Liking an image works
  - [ ] Following a user works
  - [ ] User list displays correctly
  - [ ] Trending images update correctly

- [ ] UI/UX
  - [ ] Pages load without errors
  - [ ] Forms validate correctly
  - [ ] Error messages display properly
  - [ ] Mobile responsiveness works

### Testing in Different Browsers

- Chrome
- Firefox
- Safari
- Edge

### Testing on Different Devices

- Desktop
- Tablet
- Mobile

## Debugging Tests

### Print Debug Information

```python
import logging
logging.basicConfig(level=logging.DEBUG)

def test_something(self):
    print("Debug info:", variable)
    self.assertTrue(condition)
```

### Use pdb (Python Debugger)

```python
def test_something(self):
    import pdb; pdb.set_trace()
    # Code execution stops here for debugging
```

### Inspect Database Queries

```python
from django.test.utils import override_settings

@override_settings(DEBUG=True)
def test_database_query_count(self):
    from django.db import connection
    from django.test.utils import CaptureQueriesContext

    with CaptureQueriesContext(connection) as context:
        # Your test code
        pass

    print(f"Number of queries: {len(context)}")
    for query in context:
        print(query)
```

## Performance Testing

### Load Testing with Locust

```python
from locust import HttpUser, task

class WebsiteUser(HttpUser):
    @task
    def index(self):
        self.client.get("/")
```

Run with:

```bash
pip install locust
locust -f locustfile.py
```

## Contributing Tests

When submitting a pull request:

- [ ] All tests pass locally
- [ ] New features have corresponding tests
- [ ] Bug fixes include regression tests
- [ ] Coverage doesn't decrease
- [ ] Tests follow project conventions

For more information, see [CONTRIBUTING.md](../CONTRIBUTING.md).

---

Last updated: 2026-08-29
