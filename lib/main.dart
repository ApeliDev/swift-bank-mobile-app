import 'package:flutter/material.dart';
import 'package:tony/screens/login_page.dart';
import 'package:tony/screens/dashboard_page.dart';
import 'package:tony/utils/theme.dart';
import 'package:tony/screens/account_page.dart';

void main() {
  runApp(const SwiftBankApp());
}

class SwiftBankApp extends StatelessWidget {
  const SwiftBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiftBank',
      theme: SwiftBankTheme.lightTheme,
      darkTheme: SwiftBankTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/account': (context) => DashboardScreen(),

      },
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
