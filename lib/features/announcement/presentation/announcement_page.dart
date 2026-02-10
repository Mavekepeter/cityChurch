import 'package:flutter/material.dart';

class MyannouncementPage extends StatefulWidget {
  const MyannouncementPage({super.key});

  @override
  State<MyannouncementPage> createState() => _MyannouncementPageState();
}

class _MyannouncementPageState extends State<MyannouncementPage> {

  /// Sample announcements (later you will fetch from API)
  final List<Map<String, String>> announcements = [
    {
      "title": "Sunday Service",
      "date": "Every Sunday - 8:00 AM",
      "description": "Join us for our main worship service. Come with a friend and be blessed.",
    },
    {
      "title": "Youth Fellowship",
      "date": "Friday - 5:00 PM",
      "description": "All youths are invited for worship, games, and Bible study.",
    },
    {
      "title": "Keshas Night",
      "date": "28th Feb - 9:00 PM",
      "description": "A powerful overnight prayer and worship experience.",
    },
    {
      "title": "Bible Study",
      "date": "Wednesday - 6:00 PM",
      "description": "Mid-week Bible teaching and discussion session.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Church Announcements"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: announcements.length,
        itemBuilder: (context, index) {

          final announcement = announcements[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Title
                  Text(
                    announcement["title"]!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Date
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 18, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        announcement["date"]!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Description
                  Text(
                    announcement["description"]!,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
