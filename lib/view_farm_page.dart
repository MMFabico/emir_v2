import 'package:emir_v2/reusable_widgets/navigation_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:emir_v2/models/farm.dart';
import 'package:emir_v2/reusable_widgets/utils.dart';

class ViewFarmPage extends StatelessWidget {
  final Farm farm;
  const ViewFarmPage({Key? key, required this.farm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedTime = formatDateTime(farm.createdTime);

    return Scaffold(
      drawer: NavigationMenuDrawer(),
      appBar: AppBar(title: Text('${farm.name} Details')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${farm.name}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Icon(
                //   farm.status ? Icons.check_circle : Icons.cancel,
                //   color: farm.status ? Colors.green : Colors.red,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                  ],
                )
              ],
            ),
            Text(
              '${farm.cropType}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Created: $formattedTime',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            Text(
              '${farm.description}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'INSERT CALENDAR HERE',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
