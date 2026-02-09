import 'package:flutter/material.dart';

class MyeventsPage extends StatefulWidget {
  const MyeventsPage({super.key});

  @override
  State<MyeventsPage> createState() => _MyeventsPageState();
}

class _MyeventsPageState extends State<MyeventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
    );
  }
}