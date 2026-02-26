import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(currentPage: "Settings"),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with icons
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hamburger icon with background + shadow
                  Builder(
                    builder: (context) => Container(
                      child: IconButton(
                        padding: const EdgeInsets.all(10.0),
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
                  ),
                ],
              ),
            ),
            // TODO: Add content for the Settings page here
            const Expanded(
              child: Center(
                child: Text("SETTINGS PAGE", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
