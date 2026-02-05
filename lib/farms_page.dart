import 'package:emir_v2/add_farm_modal.dart';
import 'package:emir_v2/database/farm_db.dart';
import 'package:emir_v2/reusable_widgets/navigation_menu_drawer.dart';
import 'package:emir_v2/reusable_widgets/utils.dart';
import 'package:emir_v2/view_farm_page.dart';
import 'package:flutter/material.dart';
import 'package:emir_v2/models/farm.dart';

class FarmsPage extends StatefulWidget {
  @override
  _FarmsPageState createState() => _FarmsPageState();
}

class _FarmsPageState extends State<FarmsPage> {
  List<Farm> farms = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshMyFarm();
  }

  Future refreshMyFarm() async {
    setState(() => isLoading = true);
    farms = await MyFarmDatabase.instance.allFarm();
    setState(() => isLoading = false);
  }

  // for adding new farms
  void _showAddFarmModal(Function refreshCallback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Farm"),
          content: AddFarmForm(onFarmAdded: refreshCallback),
        );
      },
    );
  }

  Widget buildMyFarm() {
    return ListView.builder(
      itemCount: farms.length,
      itemBuilder: (context, index) {
        final farm = farms[index];
        final formattedTime = formatDateTime(farm.createdTime);
        return Card(
          child: ListTile(
            title: Text(farm.name),
            subtitle: Text("${farm.description}\nCreated: $formattedTime"),
            trailing: Text(farm.cropType),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ViewFarmPage(farm: farm),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(title: const Text('Farms List')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : farms.isEmpty
            ? const Center(child: Text('No farm yet.'))
            : Column(children: [Expanded(child: buildMyFarm())],),
            ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddFarmModal(refreshMyFarm);
        },
        backgroundColor: Color(0xFF00543A), // Customize color
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
