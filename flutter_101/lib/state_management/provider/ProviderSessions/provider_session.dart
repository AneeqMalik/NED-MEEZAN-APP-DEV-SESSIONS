import 'package:flutter/material.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/model/items.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/model/user.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatefulWidget {
  const ProviderExample({super.key});

  @override
  State<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final items = Provider.of<Items>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User ID: ${user.properties['id']}'),
            Text('User Name: ${user.properties['name']}'),
            Text('User Email: ${user.properties['email']}'),
            Text('Item ID: ${items.properties['id']}'),
            Text('Item Name: ${items.properties['name']}'),
            Text('Item Price: ${items.properties['price']}'),
            Text('Item Description: ${items.properties['description']}'),
          ],
        ),
      ),
    );
  }
}
