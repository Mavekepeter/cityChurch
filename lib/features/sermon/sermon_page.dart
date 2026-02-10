import 'package:flutter/material.dart';

class SermonsPage extends StatefulWidget {
  const SermonsPage({super.key});

  @override
  State<SermonsPage> createState() => _SermonsPageState();
}

class _SermonsPageState extends State<SermonsPage> {

  /// Sample sermon data (later from backend)
  final List<Map<String, String>> sermons = [
    {
      "title": "Walking by Faith",
      "preacher": "Rev. John Mwangi",
      "date": "2 Feb 2026",
      "content":
          "Faith is trusting God even when you cannot see the outcome. Hebrews 11 teaches us that faith is the substance of things hoped for, the evidence of things not seen. As believers we are called to depend on God daily.",
    },
    {
      "title": "Power of Prayer",
      "preacher": "Pastor Mary Wanjiru",
      "date": "26 Jan 2026",
      "content":
          "Prayer connects us to God. When we pray, we invite God into our situations. Jesus Himself prayed often and taught us to pray without ceasing.",
    },
    {
      "title": "Love Your Neighbor",
      "preacher": "Bishop Peter Njoroge",
      "date": "19 Jan 2026",
      "content":
          "Christianity is founded on love. Jesus commanded us to love one another just as He loved us. Forgiveness and kindness must be part of our daily lives.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sermons"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sermons.length,
        itemBuilder: (context, index) {

          final sermon = sermons[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SermonDetailPage(sermon: sermon),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Title
                    Text(
                      sermon["title"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Preacher
                    Text(
                      "By ${sermon["preacher"]}",
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 6),

                    /// Date
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(
                          sermon["date"]!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// Preview
                    Text(
                      sermon["content"]!.substring(0, 80) + "...",
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Tap to read more",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}






/// ================= DETAIL PAGE =================

class SermonDetailPage extends StatelessWidget {
  final Map<String, String> sermon;

  const SermonDetailPage({super.key, required this.sermon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sermon["title"]!),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              sermon["title"]!,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "By ${sermon["preacher"]}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 5),

            Text(
              sermon["date"]!,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 20),

            Text(
              sermon["content"]!,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
