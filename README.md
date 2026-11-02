
# Adable — Flutter Frontend

Adable is a personal full-stack project for managing digital advertising campaigns.

This repository contains the Flutter frontend, which communicates with a Python backend built using Django REST Framework.

## Features

- View advertising campaigns retrieved from the REST API
- Display the total number of campaigns
- Create new campaigns
- View individual campaign details
- Delete campaigns with a confirmation dialog
- Refresh campaign data after creating or deleting a campaign

## Tech Stack

- Flutter & Dart
- Material Design
- HTTP package for REST API communication
- Django REST Framework (separate backend)

## Project Structure

```text
lib/
├── main.dart
├── pages/
│   ├── campagne_page.dart
│   ├── dettaglio_campagne.dart
│   └── nuova_campagna_page.dart
├── services/
│   └── campagne_api.dart
├── theme/
│   └── app_spacing.dart
└── widgets/
    ├── card_campagna.dart
    └── stat_card.dart
```

## Getting Started

### Requirements

- Flutter SDK
- A running Adable Django backend
- Windows desktop environment (used for local development and testing)

### Run the application

Install dependencies:

```bash
flutter pub get
```

Start the Flutter application:

```bash
flutter run -d windows
```

The frontend currently connects to the local backend at:

`http://localhost:8000/api/campagne/`

The Django backend must be running on port `8000` for API operations to work.

## Project Status

This project was developed as a learning and portfolio project, focusing on Flutter UI development, application navigation, and integration with REST APIs.

## Backend

The Django REST Framework backend is maintained separately.
