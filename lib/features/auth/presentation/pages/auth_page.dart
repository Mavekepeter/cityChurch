/*
Auth Page - Determines rendering of Login or register page
*/

import 'package:citychurch/features/auth/presentation/pages/login_page.dart';
import 'package:citychurch/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show login page
  bool showloginPage = true;

  //toggle between pages
  void togglePages() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return LoginPage(
        togglePages: togglePages,
      );
    } else {
      return RegisterPage(
        togglePage: togglePages,
      );
    }
  }
}
