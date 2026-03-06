import 'package:emir_new/farm_summary_card.dart';
import 'package:emir_new/report_summary_card.dart';
import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(currentPage: "Home"),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with icons
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF06543B),
                        size: 30,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06543B),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Color(0xFF06543B),
                      size: 30,
                    ),
                    onPressed: () {
                      // TODO: Handle notification press
                    },
                  ),
                ],
              ),
            ),
            // TODO: Replace with dynamic farm and report data
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Text(
                    "Hello, <name>.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06543B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome to E-MIR. This app helps you monitor your insecticide use and make informed decisions to protect your crops and the environment.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  FarmSummaryCard(
                    farms: [
                      {"name": "Farm 1", "date": "01/02/2026", "crop": "ONION"},
                      {"name": "Farm 2", "date": "02/26/2026", "crop": "CORN"},
                      {"name": "Farm 3", "date": "03/15/2026", "crop": "ONION"},
                    ],
                  ),
                  SizedBox(height: 20),
                  ReportSummaryCard(
                    reports: [
                      {
                        "name": "Farm 1",
                        "date": "01/02/2026",
                        "description": "Lorem ipsum dolor sit amet...",
                      },
                      {
                        "name": "Farm 2",
                        "date": "02/26/2026",
                        "description": "Sed ut perspiciatis unde omnis iste...",
                      },
                      {
                        "name": "Farm 1",
                        "date": "03/15/2026",
                        "description": "At vero eos et accusamus...",
                      },
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
