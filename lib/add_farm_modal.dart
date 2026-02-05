import 'package:emir_v2/database/farm_db.dart';
import 'package:emir_v2/models/farm.dart';
import 'package:emir_v2/reusable_widgets/utils.dart';
import 'package:flutter/material.dart';

class AddFarmForm extends StatefulWidget {
  final Function onFarmAdded;  // Callback function to refresh the farm list
  const AddFarmForm({Key? key, required this.onFarmAdded}) : super(key: key);
  @override
  _AddFarmFormState createState() => _AddFarmFormState();
}

class _AddFarmFormState extends State<AddFarmForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _createdTime = DateTime.now();  // Automatically set the date

  // List of crop types for the dropdown
  final List<String> _cropTypes = ['Corn', 'Onion'];
  String? _selectedCropType;  // To store the selected crop type

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Farm Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a farm name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Farm Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          DropdownButtonFormField<String>(
            value: _selectedCropType,
            decoration: const InputDecoration(labelText: 'Crop Type'),
            items: _cropTypes.map((String crop) {
              return DropdownMenuItem<String>(
                value: crop,
                child: Text(crop),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCropType = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a crop type';
              }
              return null;
            },
          ),
          Text("Created: ${formatDateTime(_createdTime)}"),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                final newFarm = Farm(
                  name: _nameController.text,
                  description: _descriptionController.text,
                  cropType: _selectedCropType!,
                  status: true, // TODO: check what this is
                  number: 0, // TODO: check what this is too
                  createdTime: _createdTime,
                );
                await MyFarmDatabase.instance.createFarm(newFarm);
                widget.onFarmAdded(); // Call the callback to refresh the farm list
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Farm added successfully!')));
              }
            },
            child: const Text('Add Farm'),
          ),
        ],
      ),
    );
  }
}
