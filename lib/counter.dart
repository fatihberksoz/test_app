import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int value = 0;

  Counter(this.value);

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
