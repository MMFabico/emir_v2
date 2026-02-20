import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF06543B)),
              child: Text(
                "E-MIR",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with icons
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      padding: EdgeInsets.all(10.0),
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF06543B),
                        size: 30,
                      ),
                      onPressed: () {
                        Scaffold.of(
                          context,
                        ).openDrawer(); // open drawer manually
                      },
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(10.0),
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
            // Rest of the page
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("HOME PAGE", style: TextStyle(fontSize: 20))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
