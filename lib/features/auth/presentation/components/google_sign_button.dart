import 'package:flutter/material.dart';

class MyGoogleSignInButton extends StatelessWidget {
  final VoidCallback? onTap;

  const MyGoogleSignInButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/google.png',
            height: 48, // increased size
            width: 48,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
