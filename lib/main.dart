import 'package:flutter/material.dart';

import 'themes/themes.dart';
import 'views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinner Is Done',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(iconTheme: IconThemeData(color: Themes.secondtextColor)),
        iconTheme:const IconThemeData(color: Themes.secondtextColor),
        scaffoldBackgroundColor: Themes.backgroundColor,
        primarySwatch: Themes.accentColor,
      ),
      home: const HomePage()
    );
  }
}

