import 'package:flutter/material.dart';

class NavigatorService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigatorService instance = NavigatorService();

  NavigatorService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  goTo(Widget rn) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => rn));
  }

  pop(Widget rn) {
    return navigationKey.currentState!.pop();
  }
}
