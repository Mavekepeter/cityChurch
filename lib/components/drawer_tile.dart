import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawerTile({
    super.key, 
    required this.text, 
    required this.icon, 
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,top: 10),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
