import 'package:flutter/material.dart';
import 'widgets/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          tabBarTheme: const TabBarTheme(labelColor: Colors.black)),
      home: const MyTabBar(),
    );
  }
}
