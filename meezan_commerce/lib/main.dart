import 'package:flutter/material.dart';
import 'package:meezan_commerce/providers/products_provider.dart';
import 'package:meezan_commerce/providers/theme_provider.dart';
import 'package:meezan_commerce/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: ProxyProvider(
        update: (_, ThemeProvider themeProvider, __) => themeProvider.themeData,
        create: (_) => ThemeData.light(),
        child: Consumer<ThemeData>(
          builder: (_, themeData, __) {
            return MaterialApp(
              title: 'Meezan Commerce',
              theme: themeData,
              home: const MainScreen(),
            );
          },
        ),
      ),
    );
  }
}
