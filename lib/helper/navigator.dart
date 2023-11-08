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

  pop() {
    return navigationKey.currentState!.pop();
  }

  showLoader() {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: navigationKey.currentContext!,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          });
    });
  }
}
