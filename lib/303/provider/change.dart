import 'package:flutter/cupertino.dart';

class ChangeLoad extends ChangeNotifier {
  bool isLod = true;
  void changeLod() {
    isLod = !isLod;
    notifyListeners();
  }
}
