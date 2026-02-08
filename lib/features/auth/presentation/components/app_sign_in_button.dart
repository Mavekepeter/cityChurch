import 'package:flutter/material.dart';

class MyAppleSignInButton extends StatelessWidget {
  const MyAppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.tertiary)
        ),
        child: Image.asset(
          'lib/assets/apple.png',
          height: 32,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
      ),
    );
  }
}