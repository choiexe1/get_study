# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application built with GetX state management and Clean Architecture principles. The project implements a crypto wallet UI with portfolio tracking, asset management, and transaction history features.

## Essential Commands

### Development
- `flutter run` - Run the app in development mode
- `flutter run --release` - Run optimized release build
- `flutter analyze` - Run static code analysis (use this after code changes)
- `flutter pub get` - Install dependencies
- `flutter pub upgrade` - Update dependencies
- `flutter clean` - Clean build cache

### Code Quality
- Static analysis is configured via `analysis_options.yaml` using `flutter_lints`
- Always run `flutter analyze` before committing changes
- The project uses Dart 3.8.1+ with null safety

## Architecture

### Clean Architecture Structure
```
lib/
├── core/              # Base classes, exceptions, utilities
├── data/              # Data sources, models, repository implementations
├── domain/            # Entities, repository interfaces, use cases
└── presentation/      # UI layer (pages, widgets, controllers)
```

### State Management
- **GetX Framework**: Used for state management, dependency injection, and routing
- **Controllers**: Located in `presentation/controllers/`, follow GetX controller pattern
- **Bindings**: Each feature has its own binding class for dependency injection
- **Global Bindings**: Core dependencies initialized in `global_bindings.dart`

### UI Structure
- **Pages**: Top-level screens in `presentation/pages/`
- **Widgets**: Reusable UI components in `presentation/widgets/` (minimal units only)
- **Components**: Complex UI compositions in `presentation/components/`
- **Scaffolds**: Layout templates in `presentation/components/scaffolds/`

### Key Dependencies
- **GetX**: State management and routing (`get: ^4.7.2`)
- **ShadCN UI**: UI component library (`shadcn_ui: ^0.28.0`)
- **GetStorage**: Local storage (`get_storage: ^2.1.1`)
- **FlutterSVG**: SVG asset support (`flutter_svg: ^2.2.0`)

### Routing
- Centralized routing in `config/routes/app_router.dart`
- Route constants defined in `config/routes/app_routes.dart`
- Uses GetX navigation system

### Assets
- Images stored in `assets/images/`
- Image constants defined in `config/constants/image_constants.dart`
- SVG logos for cryptocurrencies (Bitcoin, Ethereum, Tron)

### Storage
- Uses GetStorage for local persistence
- Storage keys centralized in `config/constants/storage_key.dart`
- User session management integrated

### Theming
- Dark theme configured as default using ShadCN UI
- Theme applied globally in `main.dart`
- Neutral color scheme used throughout

## Development Guidelines

### Widget Organization
- Keep widgets as minimal units in `widgets/` folder
- Place complex compositions in `components/` folder
- Use existing widgets before creating new ones
- Follow the established naming conventions

### Controller Pattern
- Controllers extend GetxController
- Use Rx variables for reactive state
- Implement proper lifecycle methods (onInit, onClose)
- Separate business logic from UI

### Asset Management
- Add new images to `assets/images/` directory
- Update `pubspec.yaml` assets section
- Define constants in `image_constants.dart`

### Code Style
- Follow Flutter/Dart conventions
- Use meaningful variable and function names
- Keep functions focused and single-purpose
- Add proper error handling where needed