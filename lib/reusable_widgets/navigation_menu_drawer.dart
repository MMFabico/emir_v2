import 'package:emir_v2/home.dart';
import 'package:flutter/material.dart';
import 'package:emir_v2/farms_page.dart';

class NavigationMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF00543A)),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeRoute()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('Your Farms'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FarmsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Your Reports'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => FarmsPage()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text('E-MIR Maps'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => FarmsPage()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.import_contacts),
            title: Text('E-MIR Learn'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => FarmsPage()),
              // );
            },
          ),
        ],
      ),
    );
  }
}