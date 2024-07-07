# Flutter Auth App

A simple Flutter application demonstrating authentication implementation using the BLoC pattern.

## Features

- User registration
- User login
- Logout
- Token storage using SharedPreferences
- Route protection using BLoC pattern

## Project Structure

lib/
├── bloc/
│   ├── auth_bloc.dart
│   ├── auth_event.dart
│   └── auth_state.dart
├── models/
│   └── user_model.dart
├── repositories/
│   └── auth_repository.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── home_screen.dart
├── widgets/
│   ├── custom_button.dart
│   └── custom_text_field.dart
└── main.dart

## Dependencies

- flutter_bloc:
- http:
- shared_preferences: