import 'package:flutter/material.dart';
import 'package:trainee/pages/home.dart';

void main() {
  runApp(const NetForemostNewsApp());
}

class NetForemostNewsApp extends StatelessWidget {
  const NetForemostNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
