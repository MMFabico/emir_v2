import 'package:emir_new/elearn.dart';
import 'package:emir_new/farms.dart';
import 'package:emir_new/home.dart';
import 'package:emir_new/reports.dart';
import 'package:emir_new/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavDrawer extends StatelessWidget {
  final String currentPage; // pass in the current page name

  const NavDrawer({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
          _buildTile(context, icon: Icons.home, title: "Home", page: "Home"),
          _buildTile(context, icon: Icons.grass, title: "Farms", page: "Farms"),
          _buildTile(
            context,
            icon: Icons.sticky_note_2_outlined,
            title: "Reports",
            page: "Reports",
          ),
          _buildTile(
            context,
            icon: Icons.book,
            title: "E-Learn",
            page: "E-Learn",
          ),
          _buildTile(
            context,
            icon: Icons.settings,
            title: "Settings",
            page: "Settings",
          ),
          _buildTile(
            context,
            icon: Icons.exit_to_app,
            title: "Exit",
            page: "Exit",
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String page,
  }) {
    final bool isSelected = currentPage == page;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? const Color(0xFF06543B)
            : const Color.fromARGB(255, 81, 92, 84),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? const Color(0xFF06543B)
              : const Color.fromARGB(255, 81, 92, 84),
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0x2006543B),
      // Disable tap if it's the current page
      onTap: isSelected
          ? null
          : () {
              Navigator.pop(context);

              if (page == "Home") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (page == "Farms") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FarmPage()),
                );
              } else if (page == "Reports") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
                );
              } else if (page == "E-Learn") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ElearnPage()),
                );
              } else if (page == "Settings") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              } else if (page == "Exit") {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Exit"),
                      content: const Text(
                        "Are you sure you want to exit the app?",
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop(); // close the dialog
                          },
                        ),
                        TextButton(
                          child: const Text("Exit"),
                          onPressed: () {
                            Navigator.of(context).pop(); // close the dialog
                            SystemNavigator.pop(); // close the app
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
    );
  }
}
