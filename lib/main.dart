import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainee/helper/navigator.dart';
import 'package:trainee/pages/home.dart';
import 'package:trainee/view_model/news_vm.dart';

void main() {
  runApp(const NetForemostNewsApp());
}

class NetForemostNewsApp extends StatelessWidget {
  const NetForemostNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsVM>(
            create: (_) => NewsVM(NavigatorService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.instance.navigationKey,
        title: 'NetForemostNewsApp',
        home: const HomePage(),
        theme: ThemeData(
            useMaterial3: true,
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.5),
              titleMedium: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.5),
              labelMedium: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff909090),
              ),
            )),
      ),
    );
  }
}
