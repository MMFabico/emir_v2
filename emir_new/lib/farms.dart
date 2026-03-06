import 'package:flutter/material.dart';
import 'nav_drawer.dart';
import 'package:intl/intl.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  // TODO: Replace with dynamic farm data (for now, this is just placeholder data to show the UI)
  final List<Map<String, String>> farms = [
    {
      "name": "Farm 1",
      "date": "01/02/2026",
      "crop": "ONION",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    },
    {
      "name": "Farm 2",
      "date": "02/26/2026",
      "crop": "CORN",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    },
    {
      "name": "Farm 3",
      "date": "03/15/2026",
      "crop": "ONION",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    },
    {
      "name": "Farm 4",
      "date": "04/01/2026",
      "crop": "CORN",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    },
  ];
  String? selectedCrop; // default option for dropdown
  final List<String> cropOptions = ["ONION", "CORN"];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cropController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(currentPage: "Farms"),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
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

                  const Text(
                    "All Farms",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06543B),
                    ),
                  ),
                  const SizedBox(width: 30), // Placeholder for spacing
                ],
              ),
            ),
            // Farm cards list (scrollable)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: farms.map((farm) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      color: const Color.fromARGB(255, 106, 148, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      farm['name'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Created: ${farm['date'] ?? ''}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF06543B),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  farm['crop'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              farm['description'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              maxLines: 3, // <-- limit to 3 lines
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF06543B),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // TODO: Implement add farm functionality

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: const Text(
                  "Add New Farm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06543B),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Farm Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedCrop,
                        hint: const Text("Select Crop"),
                        decoration: const InputDecoration(
                          labelText: "Crop",
                          border: OutlineInputBorder(),
                        ),
                        items: cropOptions.map((crop) {
                          return DropdownMenuItem(
                            value: crop,
                            child: Text(crop),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCrop = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // close modal
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06543B),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      final String name = nameController.text.trim();
                      final String? crop = selectedCrop;

                      // Name empty
                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xFF06543B),
                            content: Text("Farm name cannot be empty."),
                          ),
                        );
                        return;
                      }

                      // Crop not selected
                      if (crop == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xFF06543B),
                            content: Text("Please select a crop."),
                          ),
                        );
                        return;
                      }

                      // Case-insensitive duplicate check
                      final bool nameExists = farms.any(
                        (farm) =>
                            farm["name"]!.toLowerCase() == name.toLowerCase(),
                      );

                      if (nameExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xFF06543B),
                            content: Text(
                              "A farm with this name already exists.",
                            ),
                          ),
                        );
                        return;
                      }

                      final String currentDate = DateFormat(
                        'MM/dd/yyyy',
                      ).format(DateTime.now());

                      setState(() {
                        farms.add({
                          "name": name,
                          "date": currentDate,
                          "crop": crop,
                          "description": descriptionController.text,
                        });
                      });

                      nameController.clear();
                      descriptionController.clear();
                      selectedCrop = null;

                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
