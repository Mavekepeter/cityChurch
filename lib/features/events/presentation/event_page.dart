import 'package:flutter/material.dart';

class MyeventsPage extends StatefulWidget {
  const MyeventsPage({super.key});

  @override
  State<MyeventsPage> createState() => _MyeventsPageState();
}

class _MyeventsPageState extends State<MyeventsPage> {

  // temporary demo data (later from API/MySQL/Firebase)
  final List<Map<String, String>> events = [
    {
      "title": "Sunday Worship Service",
      "date": "16 Feb",
      "time": "9:00 AM",
      "location": "Main Sanctuary",
      "image": "lib/assets/icon.jpeg"
    },
    {
      "title": "Youth Fellowship",
      "date": "21 Feb",
      "time": "5:30 PM",
      "location": "Youth Hall",
      "image": "lib/assets/icon.jpeg"
    },
    {
      "title": "Prayer & Fasting",
      "date": "25 Feb",
      "time": "6:00 AM",
      "location": "Church Chapel",
      "image": "lib/assets/icon.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fb),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Church Events",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [

                /// DATE BADGE
                Container(
                  width: 75,
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xff2563eb),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      event["date"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                /// EVENT DETAILS
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          event["title"]!,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 18, color: Colors.grey),
                            const SizedBox(width: 6),
                            Text(event["time"]!, style: const TextStyle(color: Colors.black87)),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 18, color: Colors.grey),
                            const SizedBox(width: 6),
                            Text(event["location"]!, style: const TextStyle(color: Colors.black87)),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff16a34a),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Registered for ${event["title"]}"),
                                ),
                              );
                            },
                            child: const Text("Attend"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
