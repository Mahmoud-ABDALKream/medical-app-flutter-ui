# Medical App - Flutter UI Implementation

A comprehensive medical and healthcare Flutter application with modern UI design, converted from the provided design mockups.

## Features

### 🏥 Core Functionality
- **Splash Screen** - Branded introduction with app logo
- **Authentication** - Login screen with email/password and social login options
- **Dashboard** - Main overview with health metrics and recent activities
- **Health Monitoring** - Detailed health dashboard with charts and trends
- **Payment Management** - Wallet interface with payment cards and transactions
- **User Profile** - Complete profile management with settings

### 🎨 Design Features
- **Responsive Design** - Adapts to different screen sizes using MediaQuery
- **Modern UI** - Clean, minimalist interface with consistent blue color scheme
- **Custom Components** - Reusable widgets for buttons, cards, and input fields
- **Smooth Navigation** - Bottom navigation with animated transitions
- **Interactive Elements** - Touch feedback and loading states

### 📱 Screens Included

1. **Splash Screen** (`splash_screen.dart`)
   - App branding with medical icon
   - Get started and skip options
   - Smooth transition to login

2. **Login Screen** (`login_screen.dart`)
   - Email and password authentication
   - Social login options (Google, Facebook)
   - Form validation and loading states
   - Forgot password functionality

3. **Dashboard Screen** (`dashboard_screen.dart`)
   - Personalized greeting
   - Quick health stats (Heart Rate, Steps)
   - Recent activities timeline
   - Health metrics overview

4. **Health Dashboard** (`health_dashboard_screen.dart`)
   - Detailed health metrics grid
   - Interactive charts and trends
   - Recent readings history
   - Tab-based navigation for different metrics

5. **Payment Screen** (`payment_screen.dart`)
   - Payment cards carousel
   - Balance display
   - Quick actions (Top Up, Transfer, Bills)
   - Transaction history

6. **Profile Screen** (`profile_screen.dart`)
   - User information display
   - Quick stats (Appointments, Records, Health Score)
   - Settings toggles (Notifications, Dark Mode, Biometric)
   - Menu options for additional features

### 🧩 Custom Widgets

- **CustomButton** - Consistent button styling with loading states
- **CustomInputField** - Form inputs with validation and icons
- **CustomCard** - Elevated containers with consistent shadows
- **StatCard** - Health metric display cards
- **PaymentCard** - Credit card UI components
- **CustomBottomNavigation** - Animated bottom navigation bar

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd medical_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart                 # App entry point and routing
├── screens/                  # All screen widgets
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   ├── dashboard_screen.dart
│   ├── health_dashboard_screen.dart
│   ├── payment_screen.dart
│   └── profile_screen.dart
└── widgets/                  # Reusable UI components
    ├── custom_button.dart
    ├── custom_input_field.dart
    ├── custom_card.dart
    └── bottom_navigation.dart
```

## 🎨 Design System

### Color Palette
- **Primary Blue**: `#4285F4` - Main brand color
- **Success Green**: `#10B981` - Positive actions and health metrics
- **Warning Orange**: `#FF6B35` - Alerts and important information
- **Error Red**: `#E53E3E` - Errors and negative values
- **Text Primary**: `#1A1A1A` - Main text color
- **Text Secondary**: `#666666` - Secondary text
- **Background**: `#F8F9FA` - App background
- **Card Background**: `#FFFFFF` - Card and container backgrounds

### Typography
- **Font Family**: Roboto (system default)
- **Heading Large**: 28px, Bold
- **Heading Medium**: 20px, Bold
- **Body Large**: 16px, Medium
- **Body Small**: 14px, Regular
- **Caption**: 12px, Regular

### Spacing
- **Extra Small**: 4px
- **Small**: 8px
- **Medium**: 16px
- **Large**: 24px
- **Extra Large**: 32px

## 📱 Responsive Design

The app uses `MediaQuery` and `LayoutBuilder` to ensure responsive design across different screen sizes:

- **Phone Portrait**: Optimized for mobile devices
- **Phone Landscape**: Adjusted layouts for landscape orientation
- **Tablet**: Expanded layouts with better use of screen space

## 🔧 Customization

### Adding New Screens
1. Create a new file in `lib/screens/`
2. Extend `StatelessWidget` or `StatefulWidget`
3. Add route in `main.dart`
4. Update navigation in relevant screens

### Modifying Colors
Update the color constants in each widget file or create a centralized theme file.

### Adding New Widgets
1. Create widget file in `lib/widgets/`
2. Follow existing naming conventions
3. Include proper documentation
4. Import and use in relevant screens

## 🧪 Testing

### Manual Testing Checklist
- [ ] All screens load correctly
- [ ] Navigation works between screens
- [ ] Forms validate input properly
- [ ] Responsive design works on different screen sizes
- [ ] Loading states display correctly
- [ ] Error handling works as expected

### Running Tests
```bash
flutter test
```

## 📦 Dependencies

### Core Dependencies
- `flutter` - Flutter SDK
- `cupertino_icons` - iOS-style icons

### Development Dependencies
- `flutter_test` - Testing framework
- `flutter_lints` - Code linting rules

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 📄 License

This project is created as a UI implementation based on provided design mockups. Please ensure you have the rights to use the design before commercial deployment.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For questions or issues, please create an issue in the repository or contact the development team.

---

**Note**: This is a UI implementation based on design mockups. For a production app, you would need to integrate with real APIs, add proper state management, implement security measures, and add comprehensive testing.
