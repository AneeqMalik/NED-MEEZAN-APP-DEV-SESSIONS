
import 'dart:async';

import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _count++;
      notifyListeners();
    });
  }

}