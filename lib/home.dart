import 'package:emir_v2/database/farm_db.dart';
import 'package:emir_v2/farms_page.dart';
import 'package:emir_v2/reusable_widgets/navigation_menu_drawer.dart';
import 'package:emir_v2/view_farm_page.dart';
import 'package:flutter/material.dart';
import 'package:emir_v2/models/farm.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  List<Farm> farms = [];
  // // late List<Farm> farm;
  // // Farm? farms;
  // late List<InsecticideHistoryModel> insecticidehistory;
  // late InsecticideHistoryModel currentInsecticide;
  // final _currentInsecticideController = TextEditingController();
  bool isLoading = false;
  // bool isNewRecord = true;
  // int? selectedId;
  // bool tablehascontent = false;
  // String name = 'a';
  // final today = DateTime.now();
  // final desiredDate = DateTime.now().add(const Duration(days: 90));
  // final TextEditingController _name = TextEditingController();
  // final TextEditingController _start_date = TextEditingController();
  // final TextEditingController _end_date = TextEditingController();
  // final _dateTime = DateTime.now().subtract(const Duration(days: 1));

  @override
  void initState() {
    super.initState();
    refreshFarms();
    // isInsecticideHistoryNew();
    // getCurrentInsecticide();
    // isInsecticideHistoryCompletedBefore();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future refreshFarms() async {
    setState(() => isLoading = true);
    // farms = (await MyFarmDatabase.instance.allFarm()) as Farm;
    farms = await MyFarmDatabase.instance.allFarm();
    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00543A),
        title: const Text(
          'E-MIR',
          style: TextStyle(color: Colors.white),
        ), 
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      drawer: NavigationMenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Welcome to E-MIR, '), // Normal text
                    TextSpan(
                      text: 'User', 
                      style: TextStyle(
                        fontStyle: FontStyle.italic, // Italicize "User"
                      ),
                    ),
                    TextSpan(text: '.'), // Normal text
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 10),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              const SizedBox(height: 10),
              
              Text(
                'Your Farms',
                style: Theme.of(context).textTheme.titleMedium
              ),
              const SizedBox(height: 10),
              isLoading
                ? const Center(child: CircularProgressIndicator())
                : farms.isEmpty
                  ? const Center(child: Text('No farm yet.'))
                  : Column(
                      children: [
                        // Display the latest 3 farms
                        for (int i = 0; i < (farms.length > 3 ? 3 : farms.length); i++)
                          Card(
                            child: ListTile(
                            title: Text(farms[i].name),
                            subtitle: Text(farms[i].description),
                            trailing: Text(farms[i].cropType),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewFarmPage(farm: farms[i]),
                                ),
                              );
                            },
                          ),
                        ),
                        // Button to navigate to the full farm list
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FarmsPage(),
                              ),
                            );
                          },
                          child: Text('View All Farms', style: TextStyle(color: Color(0xFF00543A)),),
                        ),
                      ],
                    ),

              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              const SizedBox(height: 10),

              Text(
                'Your Reports',
                style: Theme.of(context).textTheme.titleMedium
              ),
              const SizedBox(height: 10),
              isLoading
                ? const Center(child: CircularProgressIndicator())
                : farms.isEmpty
                  ? const Center(child: Text('No farm yet.'))
                  : Column(
                      children: [
                        // Display the latest 3 farms
                        for (int i = 0; i < (farms.length > 3 ? 3 : farms.length); i++)
                          Card(
                            child: ListTile(
                            title: Text(farms[i].name),
                            subtitle: Text(farms[i].description),
                            trailing: Text(farms[i].cropType),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewFarmPage(farm: farms[i]),
                                ),
                              );
                            },
                          ),
                        ),
                        // Button to navigate to the full farm list
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FarmsPage(),
                              ),
                            );
                          },
                          child: Text('View All Farms', style: TextStyle(color: Color(0xFF00543A)),),
                        ),
                      ],
                    ),
              
            ],
          ),
        ),
      )
    );
  }
}