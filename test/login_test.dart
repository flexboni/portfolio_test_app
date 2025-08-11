import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_test_app/features/auth/presentation/pages/login_page.dart';
import 'package:portfolio_test_app/core/constants/strings.dart';

void main() {
  group('Login Page Tests', () {
    testWidgets('should show login form', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Check if all form elements are present
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text(Strings.appName), findsOneWidget);
      expect(find.text(Strings.userId), findsOneWidget);
      expect(find.text(Strings.password), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, Strings.login), findsOneWidget);
      expect(find.widgetWithText(TextButton, Strings.signup), findsOneWidget);
    });

    testWidgets('should validate empty fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Try to login with empty fields
      await tester.tap(find.widgetWithText(ElevatedButton, Strings.login));
      await tester.pumpAndSettle();

      // Should show validation errors
      expect(find.text(Strings.errorUserIdEmpty), findsOneWidget);
      expect(find.text(Strings.errorPasswordEmpty), findsOneWidget);
    });

    testWidgets('should validate individual fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      final userIdField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).at(1);

      // Test with only user ID filled
      await tester.enterText(userIdField, 'testuser');
      await tester.tap(find.widgetWithText(ElevatedButton, Strings.login));
      await tester.pumpAndSettle();

      expect(find.text(Strings.errorUserIdEmpty), findsNothing);
      expect(find.text(Strings.errorPasswordEmpty), findsOneWidget);

      // Clear and test with only password filled
      await tester.enterText(userIdField, '');
      await tester.enterText(passwordField, 'password');
      await tester.tap(find.widgetWithText(ElevatedButton, Strings.login));
      await tester.pumpAndSettle();

      expect(find.text(Strings.errorUserIdEmpty), findsOneWidget);
      expect(find.text(Strings.errorPasswordEmpty), findsNothing);
    });

    testWidgets('should attempt login with valid credentials', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Enter valid credentials
      await tester.enterText(find.byType(TextFormField).first, 'testuser');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Tap login button
      await tester.tap(find.widgetWithText(ElevatedButton, Strings.login));
      await tester.pump();

      // Should show loading indicator briefly
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should have password field obscured', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Password field should be present
      expect(find.byType(TextFormField).at(1), findsOneWidget);
      
      // Check that password field has the correct decoration
      final passwordField = find.byType(TextFormField).at(1);
      expect(passwordField, findsOneWidget);
    });

    testWidgets('should show app name in header', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Check app name is displayed prominently
      expect(find.text(Strings.appName), findsOneWidget);
      
      // Check app bar title
      expect(find.text(Strings.login), findsAtLeastNWidgets(1));
    });

    testWidgets('should have signup button available', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Verify signup button is present and tappable
      final signupButton = find.widgetWithText(TextButton, Strings.signup);
      expect(signupButton, findsOneWidget);
      
      // Verify button exists
      expect(find.text(Strings.signup), findsAtLeastNWidgets(1));
    });

    testWidgets('should disable login button while loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );
      
      await tester.pumpAndSettle();

      // Enter valid credentials
      await tester.enterText(find.byType(TextFormField).first, 'testuser');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      // Get the login button
      final loginButton = find.widgetWithText(ElevatedButton, Strings.login);
      expect(loginButton, findsOneWidget);

      // Tap login button
      await tester.tap(loginButton);
      await tester.pump();

      // During loading, button should show loading indicator instead of text
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}