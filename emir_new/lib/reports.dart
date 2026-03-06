import 'package:flutter/material.dart';
import 'nav_drawer.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  // TODO: Replace with dynamic report data (for now, this is just placeholder data to show the UI)
  final List<Map<String, String>> reports = [
    {
      "farm": "Farm 1",
      "date": "03/01/2026",
      "type": "BEFORE",
      "pestLevel": "HIGH",
      "cropDamage": "MODERATE",
      "plantHealth": "FAIR",
      "notes": "Large pest clusters near irrigation.",
    },
    {
      "farm": "Farm 1",
      "date": "03/05/2026",
      "type": "AFTER",
      "pestLevel": "LOW",
      "cropDamage": "MINOR",
      "plantHealth": "GOOD",
      "notes": "Pests significantly reduced.",
    },
  ];

  String? selectedFarm;
  String? selectedType;
  String? selectedPestLevel;
  String? selectedCropDamage;
  String? selectedPlantHealth;
  String? description;

  final List<String> farmOptions = [
    "Farm 1",
    "Farm 2",
    "Farm 3",
    "Farm 4",
  ]; // TODO: Replace with dynamic farm options from the user's farms
  // TODO: Verify information needed for the report and add more fields as necessary
  final List<String> reportTypes = ["BEFORE", "AFTER"];
  final List<String> pestLevels = ["NONE", "LOW", "MODERATE", "HIGH", "SEVERE"];
  final List<String> cropDamageLevels = ["NONE", "MINOR", "MODERATE", "HEAVY"];
  final List<String> plantHealthLevels = ["EXCELLENT", "GOOD", "FAIR", "POOR"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(currentPage: "Reports"),
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
                    "All Reports",
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
            // Report cards list (scrollable)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: reports.map((report) {
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
                                Text(
                                  report['farm'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                                ),

                                Text(
                                  report['type'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Created: ${report['date'] ?? ''}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF06543B),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "Pests: ${report['pestLevel']}",
                              style: const TextStyle(color: Colors.white),
                            ),

                            Text(
                              "Crop Damage: ${report['cropDamage']}",
                              style: const TextStyle(color: Colors.white),
                            ),

                            Text(
                              "Plant Health: ${report['plantHealth']}",
                              style: const TextStyle(color: Colors.white),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              report['notes'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              maxLines: 3,
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
          // TODO: Implement add report functionality, but this is better moved to the farm details page since a report needs to be associated with a farm. For now, this will just show the add report modal with a farm selection dropdown.

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: const Text(
                  "Add New Report",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06543B),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedFarm,
                        hint: const Text("Select Farm"),
                        decoration: const InputDecoration(
                          labelText: "Farm",
                          border: OutlineInputBorder(),
                        ),
                        items: farmOptions.map((farm) {
                          return DropdownMenuItem(
                            value: farm,
                            child: Text(farm),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFarm = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedType,
                        hint: const Text("Select Report Type"),
                        decoration: const InputDecoration(
                          labelText: "Report Type",
                          border: OutlineInputBorder(),
                        ),
                        items: reportTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedType = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedPestLevel,
                        hint: const Text("Select Pest Level"),
                        decoration: const InputDecoration(
                          labelText: "Pest Level",
                          border: OutlineInputBorder(),
                        ),
                        items: pestLevels.map((level) {
                          return DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPestLevel = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedCropDamage,
                        hint: const Text("Select Crop Damage"),
                        decoration: const InputDecoration(
                          labelText: "Crop Damage",
                          border: OutlineInputBorder(),
                        ),
                        items: cropDamageLevels.map((level) {
                          return DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCropDamage = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedPlantHealth,
                        hint: const Text("Select Plant Health"),
                        decoration: const InputDecoration(
                          labelText: "Plant Health",
                          border: OutlineInputBorder(),
                        ),
                        items: plantHealthLevels.map((level) {
                          return DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPlantHealth = value;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Notes",
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
                      if (selectedFarm == null ||
                          selectedType == null ||
                          selectedPestLevel == null ||
                          selectedCropDamage == null ||
                          selectedPlantHealth == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xFF06543B),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Please complete all required fields.",
                            ),
                          ),
                        );
                        return;
                      }

                      final String currentDate = DateFormat(
                        'MM/dd/yyyy',
                      ).format(DateTime.now());

                      setState(() {
                        reports.add({
                          "farm": selectedFarm!,
                          "date": currentDate,
                          "type": selectedType!,
                          "pestLevel": selectedPestLevel!,
                          "cropDamage": selectedCropDamage!,
                          "plantHealth": selectedPlantHealth!,
                          "notes": descriptionController.text,
                        });
                      });
                      // TODO: Validation for duplicate reports (e.g. same farm and report type on the same day) and other necessary validation

                      // 🔹 Reset fields
                      selectedFarm = null;
                      selectedType = null;
                      selectedPestLevel = null;
                      selectedCropDamage = null;
                      selectedPlantHealth = null;
                      descriptionController.clear();

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
