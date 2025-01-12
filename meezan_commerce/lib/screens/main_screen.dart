import 'package:flutter/material.dart';
import 'package:meezan_commerce/models/dogs_model.dart';
import 'package:meezan_commerce/screens/chat_screen.dart';
import 'package:meezan_commerce/screens/home_screen.dart';
import 'package:meezan_commerce/screens/settings_screen.dart';
import 'package:meezan_commerce/services/db_service.dart';
import 'package:meezan_commerce/services/notification_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SettingScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   // Create a Dog and add it to the dogs table
  //   var fido = Dog(
  //     id: 0,
  //     name: 'Fido',
  //     age: 35,
  //   );

  //   await insertDog(fido);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
