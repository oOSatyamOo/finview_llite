# finview_llite

> A clean and beautiful investment insights dashboard built with Flutter.

![GitHub stars](https://img.shields.io/github/stars/oOSatyamOo/finview_llite?style=for-the-badge&logo=github) ![GitHub forks](https://img.shields.io/github/forks/oOSatyamOo/finview_llite?style=for-the-badge&logo=github) ![GitHub issues](https://img.shields.io/github/issues/oOSatyamOo/finview_llite?style=for-the-badge&logo=github) ![Last commit](https://img.shields.io/github/last-commit/oOSatyamOo/finview_llite?style=for-the-badge&logo=github) ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white) ![Java (Gradle)](https://img.shields.io/badge/Java%20(Gradle)-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white) ![Kotlin](https://img.shields.io/badge/Kotlin-7F52FF?style=for-the-badge&logo=kotlin&logoColor=white)

## 📑 Table of Contents

- [Description](#description)
- [Key Features](#key-features)
- [Use Cases](#use-cases)
- [Tech Stack](#tech-stack)
- [Quick Start](#quick-start)
- [Available Scripts](#available-scripts)
- [Project Structure](#project-structure)
- [Development Setup](#development-setup)
- [Contributing](#contributing)

## 📱 Screenshots
<div align="center">
  <table border="0">
    <tr>
      <td width="48%" align="center" valign="top">
          <img src="https://github.com/user-attachments/assets/5c47c4a0-a97b-4297-a25f-f3a1d33d8af7" width="100%" />
        </a>
        <br><br>
        <a href="https://github.com/oOSatyamOo/GitHub-Language-Stats">
          <img src="https://github.com/user-attachments/assets/1954f0ed-fb1e-4b13-88ce-a2706d7c96f6" width="100%" />
        </a>
      </td>
       <td width="48%" align="center" valign="top">
          <img src="https://github.com/user-attachments/assets/54cf3d57-12c6-48a4-9565-1b7369939320" width="100%" />
        </a>
        <br><br>
        <a href="https://github.com/oOSatyamOo/GitHub-Language-Stats">
          <img src="https://github.com/user-attachments/assets/26bbb119-78c6-4970-b7c8-559578962bd1" width="100%" />
        </a>
      </td>
    </tr>
  </table>
</div>

## 📝 Description

finview_llite is a mobile application designed to provide a clean, visually appealing Investment Insights Dashboard. Built with Flutter, it tackles the challenge of presenting complex investment data in an approachable, mobile-friendly interface, giving users a clear view of their financial metrics on the go.

At its core, the application utilizes the cross-platform capabilities of Flutter, incorporating native configurations for Android and iOS. Developers can easily run, test, and build the project using standard Flutter CLI commands, enabling rapid iteration and reliable widget testing across different platforms.

This project is ideal for developers who need a solid foundation for financial tracking applications or individual investors looking to deploy a lightweight, customizable dashboard for tracking their personal portfolio metrics.

## ✨ Key Features

- **📊 Investment Dashboard Layout** — Features a structured UI layout tailored for displaying key financial insights and investment metrics.
- **📱 Cross-Platform Mobile Support** — Utilizes a single Flutter codebase to deliver native performance and UI on both Android and iOS.
- **🧪 Pre-configured Test Suite** — Supports automated verification of application components through integrated Flutter test scripts.

## 🎯 Use Cases

- Building a customized mobile portal to visualize personal investment performance and portfolio distribution.
- Using the codebase as a clean UI template for developing financial or statistics-heavy mobile dashboards.

## 🛠️ Tech Stack

- 🤖 **Android (Native)**
- 💙 **Flutter**
- ☕ **Java (Gradle)**
- 🟪 **Kotlin**
- 🍎 **iOS (Native)**

## ⚡ Quick Start

```bash

# 1. Clone the repository
git clone https://github.com/oOSatyamOo/finview_llite.git

# Get packages and run
flutter pub get && flutter run
```

## 🚀 Available Scripts

- **run** — `flutter run`
- **test** — `flutter test`

## 📁 Project Structure

```
.
├── analysis_options.yaml
├── assets
│   └── portfolio.json
├── devtools_options.yaml
├── lib
│   ├── controllers
│   │   ├── auth_controller.dart
│   │   ├── portfolio_controller.dart
│   │   └── theme_controller.dart
│   ├── core
│   │   ├── constants
│   │   │   └── app_strings.dart
│   │   ├── error
│   │   │   └── failures.dart
│   │   ├── helpers
│   │   │   └── responsive_helper.dart
│   │   ├── theme
│   │   │   └── app_theme.dart
│   │   └── widgets
│   │       └── seamless_error_widget.dart
│   ├── main.dart
│   ├── models
│   │   ├── holding_model.dart
│   │   ├── holding_model.freezed.dart
│   │   ├── holding_model.g.dart
│   │   ├── portfolio_summary_model.dart
│   │   ├── portfolio_summary_model.freezed.dart
│   │   └── portfolio_summary_model.g.dart
│   └── views
│       ├── dashboard
│       │   ├── dashboard_view.dart
│       │   └── widgets
│       │       ├── allocation_chart.dart
│       │       ├── holding_list_item.dart
│       │       └── portfolio_summary_card.dart
│       ├── home
│       │   └── home_page.dart
│       └── login
│           └── login_view.dart
├── android
├── ios
├── linux
├── macos
├── pubspec.lock
├── pubspec.yaml
├── settings.json
├── test
│   ├── controllers
│   │   └── portfolio_controller_test.dart
│   └── widgets
│       ├── holding_list_item_test.dart
│       └── portfolio_summary_card_test.dart
├── web
└── windows
```

## 🛠️ Development Setup

### Flutter
1. Install the [Flutter SDK](https://flutter.dev/docs/get-started/install)
2. `flutter pub get && flutter run`

## 👥 Contributing

Contributions are welcome! Here's the standard flow:

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/oOSatyamOo/finview_llite.git`
3. **Branch**: `git checkout -b feature/your-feature`
4. **Commit**: `git commit -m 'feat: add some feature'`
5. **Push**: `git push origin feature/your-feature`
6. **Open** a pull request

Please follow the existing code style and include tests for new behavior where applicable.

---
*This README was generated with ❤️ by [ReadmeBuddy](https://readmebuddy.com)*
