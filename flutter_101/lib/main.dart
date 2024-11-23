import 'package:flutter/material.dart';
import 'package:flutter_101/state_management/changeNotifier/providers/settings_provider.dart';
import 'package:flutter_101/state_management/changeNotifier/screens/main_screen.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/ProxyProvider/proxy_provider.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/model/items.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/model/user.dart';
import 'package:flutter_101/state_management/provider/ProviderSessions/provider_session.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     Provider(create: (_) => User()),
    //     Provider(create: (_) => Items()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const ProviderExample(),
    //   ),
    // );
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: settingsProvider.currentTheme, // Dynamically update theme
          home: const MainScreen(),
        );
      },
    );
  }
}