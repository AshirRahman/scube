# scube

A new Flutter project.

## Getting Started

# scube

scube is a Flutter-based cross-platform application scaffolded to support mobile (Android/iOS) and embedded targets. It demonstrates a modular project structure with features, services, common UI widgets, and utilities — intended as a starting point for building production Flutter apps.

**Project Status:** active development

**Primary purpose:** provide a clean, opinionated app structure and shared components for rapid feature development.

---

**Contents**

- **What this repo contains**
- **Prerequisites**
- **Getting started (setup & run)**
- **Project structure**
- **Key modules & widgets**
- **Assets & icons**
- **Testing**
- **Building & releasing**
- **Contributing**
- **License & contact**

---

## What this repo contains

- A Flutter application with modular `lib/features` for feature code.
- `lib/core` contains shared widgets, styles, constants, and utilities.
- Platform folders for Android, iOS, macOS, Linux, Windows, and web.
- Example widgets and controls such as `CustomAppBar` and data/visualization widgets.

## Prerequisites

- Flutter SDK (stable) installed and on PATH. Minimum recommended Flutter version: stable channel (check `flutter --version`).
- Platform-specific toolchains if building for mobile or desktop:
	- Android: Android SDK & Android Studio (or command-line tools)
	- iOS/macOS: Xcode (on macOS)
	- Windows: Visual Studio with required components
	- Linux: build-essential and required dev packages

## Getting started (quick)

1. Clone the repo

```bash
git clone <repo-url>
cd scube
```

2. Install dependencies

```bash
flutter pub get
```

3. Run on a connected device or simulator

```bash
flutter run            # selects an available device
```

4. Build release APK (example)

```bash
flutter build apk --release
```

## Project structure (high level)

- `lib/`
	- `main.dart` — app entry
	- `app.dart` — app bootstrap and root widget
	- `core/` — shared utilities, constants, styles, widgets
		- `common/` — common widgets (`CustomAppBar`, etc.)
		- `utils/` — constants, helpers
		- `styles/` — global text and theme helpers
	- `features/` — feature modules (each feature contains UI, controllers, models)
		- `authentication/`, `dashboard/`, `data_revenue/`, etc.
	- `routes/` — app routing definitions
- `assets/` — icons, images used by the app
- `android/`, `ios/`, `macos/`, `linux/`, `web/`, `windows/` — platform projects

> Note: This project uses the `get` package (GetX) for reactive state and routing in some modules.

## Key modules & widgets

- `CustomAppBar` (`lib/core/common/widgets/custom_appbar.dart`): a safe-area aware app bar used across screens. It now uses project-provided notification asset.
- `DataCostExpandable` (`lib/features/data_revenue/widget/data_cost_expandable.dart`): a collapsible card that shows Data/Cost rows; numbering for items is enabled.
- `IconPath` (`lib/core/utils/constants/icon_path.dart`): central list of asset icon paths used with `Image.asset`.

## Assets

- Icons and images are stored in `assets/icons/` and `assets/images/`.
- Ensure `pubspec.yaml` includes the `assets/` paths under `flutter:` so the assets are bundled.

## Testing

- Unit and widget tests can be added under `test/`.
- Run tests with:

```bash
flutter test
```

## Building & releasing

- Android APK / AAB

```bash
flutter build apk --release
flutter build appbundle --release
```


## Contributing

- Fork the repo, create a feature branch, implement changes, add tests where appropriate, and open a PR with a clear description.
- Keep changes focused and update documentation when behavior or public APIs change.

## Coding style & notes

- Follow existing project conventions (avoid one-letter variable names, use descriptive functions, keep widget files focused).


## Troubleshooting

- If assets are not found, confirm `assets:` paths in `pubspec.yaml` and that `flutter pub get` was run.
- If platform build fails, ensure required SDKs and tools are installed for that target.



---

_Last updated: 18 December 2025_