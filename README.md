# Django 4 Image Bookmark Application - Chapters 4–7 Practice

This repository contains the source code, authentication workflows, security implementations, and frontend integrations from Chapters 4 to 7 of the book **"Django 4 by Example" (Django 4 в примерах)** by Antonio Melé (Published in Russian in 2023).

The project focuses on building a full-scale, interactive social website that allows users to bookmark, share, and discover visual content (images) from around the web. It covers advanced user management, social authentication, JavaScript-driven bookmarks, dynamic thumbnails, activity streams, and performance optimization using Redis.

## 🚀 Repository Structure

The code is organized chronologically, reflecting the features added across chapters 4 through 7:

```text
.
├── README.md
├── bookmarks/                      # Django project root directory
│   ├── manage.py
│   ├── bookmarks/                  # Project configuration folder (settings, URLs)
│   ├── account/                    # Chapters 4–5: Authentication, profiles, and social login
│   │   ├── templates/account/      # Auth templates (login, registration, password reset)
│   │   ├── models.py               # Profile model with custom user relations
│   │   └── views.py                # Authentication, dashboard, and social view hooks
│   ├── images/                     # Chapters 5–7: Image bookmarking, processing, and ranking
│   │   ├── static/js/bookmarklet.js# Chapter 5: JavaScript Bookmarklet injector
│   │   ├── templates/images/       # Image gallery, detail views, and ranking sheets
│   │   └── models.py               # Image models, tagging schemas, and M2M relationships
│   └── actions/                    # Chapter 7: User activity logging stream
│       └── models.py               # Action model with Generic Foreign Keys
```
