import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class FarmPage extends StatelessWidget {
  const FarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(currentPage: "Farms"),
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
            // TODO: Add content for the Farms page here
            const Expanded(
              child: Center(
                child: Text("FARMS PAGE", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
