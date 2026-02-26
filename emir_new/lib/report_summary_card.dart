import 'package:emir_new/reports.dart';
import 'package:flutter/material.dart';
import 'farms.dart'; // for FarmPage

class ReportSummaryCard extends StatelessWidget {
  final List<Map<String, String>> reports; // each report has name, date, crop

  const ReportSummaryCard({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: const Color(0xFF06543B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Latest Reports",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Generate report cards dynamically
              Column(
                children: reports.map((report) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: const Color.fromARGB(255, 106, 148, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    report['name'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Created: ${report['date'] ?? ''}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF06543B),
                                    ),
                                  ),
                                  Text(
                                    report['description'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white70,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReportPage(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "View All Reports",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
