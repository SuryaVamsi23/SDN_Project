
# TrackExp - Expense Tracking Application

**Student:** Surya Vamsi Kalaga  
**Roll No:** IMT2020552  
**Date:** December 9, 2023

## Project Overview

TrackExp is a Flutter-based mobile application designed for seamless financial management. Users can securely log in or sign up using email/password or OAuth authentication via Google and Facebook. The primary focus is on transaction management, allowing users to view and add transactions based on selected days. Additionally, users can link their accounts with Email, Google, or Facebook for a personalized and integrated experience.

### GitHub Repository
[TrackExp GitHub Repository](https://github.com/SuryaVamsi23/SDN_Project.git)

### Video Submission
https://drive.google.com/file/d/1-Df6YOaJSWQPEnWc5EbXbb2Q7yBlaISN/view?usp=sharing

## Problem Definition

OAuth (Open Authorization) is a crucial aspect of the project, enabling users to grant limited access to their resources securely. The key objectives of OAuth include secure authentication, user control over resource access, and standardization for application developers.

**Authorization Flow:**
1. **Client Registration:** Application registers with the OAuth provider to obtain Client ID and Client Secret.
2. **Authorization Request:** Client requests user authorization from the authorization server with Client ID and permissions.
3. **User Authorization:** User accepts permissions, and the authorization server sends a code to the client.
4. **Token Request:** Client sends Client ID, Client Secret, and authorization code to the Authorization server, receiving an Access Token.
5. **Access Token:** Time-bound key for accessing user data.

## Project Analysis

The goal is to create an Android application for tracking daily and monthly expenses. Users can sign in using email, Google, or Facebook accounts. The app includes pages for sign-up, login, adding expenses, viewing details and monthly expenses, and a profile page with options to link accounts and log out.

### Screens:
1. **Sign Up Page:** Collects user information (Name, Email, Password).
2. **Login Page:** Supports email, Google, and Facebook login via OAuth.
3. **Expense Adding Page:** Allows users to add expenses with details.
4. **View Details and Monthly Expenses:** Displays a calendar for selecting dates and viewing transaction details.
5. **Profile Page:** Shows user's name, total expenditure for the current month, and options to link accounts or log out.

### OAuth Configuration
- **Google:**
  - Enable Google Sign-In API.
  - Generate OAuth client IDs.
  - Set up consent screen and specify scopes.
  - Enable Google sign-in method in Firebase console.

- **Facebook:**
  - Create a developer account on the Facebook developer website.
  - Create a new app and provide package name.
  - Use App ID and App Secret.
  - Enable Facebook sign-in method in Firebase console.

- **Linking Multiple Providers:**
  - Sign in through one provider, get a unique user identifier.
  - AuthCredentials linked to the UUID of the existing user.
  - Users can use any provider to log in.

## Implementation Environment
### Get Dependencies

Run the following command to get the required dependencies:

```bash
flutter pub get
```

### USB Debugging

Ensure that USB debugging is enabled on your Android device. For instructions, refer to the [Android Developer Documentation](https://developer.android.com/studio/debug/dev-options).

### Run the App

Connect your Android device to your computer and run the app using the following command:

```bash
flutter run
```

This will build the app and install it on your connected Android device.

### Build the App

To build the standalone APK of the application, use the following command:

```bash
flutter build apk
```

### Development Environment:
- **Flutter SDK:** Software development kit for building Flutter applications.
- **IDE:** Visual Studio Code or IntelliJ IDEA with Dart and Flutter plugins.
- **Firebase SDK:** Integration of Firebase services into the app.

### Programming Language:
- **Dart:** Programming language for Flutter app development.

### Testing Environment:
- **Emulators and Simulators:** Android Emulator for testing the application.

### USB Debugging:
- Connect your phone to USB and enable developer options for testing on a physical device.

## Result/Observation

*(Results and observations to be added after project completion)*

## References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Firebase Flutter GitHub Repository](https://github.com/firebase/flutterfire)
`
