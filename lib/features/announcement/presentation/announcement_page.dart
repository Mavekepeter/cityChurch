import 'package:flutter/material.dart';

class MyannouncementPage extends StatefulWidget {
  const MyannouncementPage({super.key});

  @override
  State<MyannouncementPage> createState() => _MyannouncementPageState();
}

class _MyannouncementPageState extends State<MyannouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("announcent page"),
      ),
    );
  }
}
