import 'package:flutter/material.dart';

class RefreshScreen extends ChangeNotifier {
  void refreshList() {
    notifyListeners();
  }
}
