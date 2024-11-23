import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_101/state_management/changeNotifier/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('SettingsScreen build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Dark Mode'),
                Consumer<SettingsProvider>(
                  builder: (context, settings, child) {
                    return Switch(
                      value: settings.isDarkMode,
                      onChanged: (value) {
                        settings.updateTheme(value);
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
