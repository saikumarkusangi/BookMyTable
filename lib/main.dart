import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'themes/themes.dart';
import 'views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
       SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white70,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Dinner Is Done',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(iconTheme: IconThemeData(color: Themes.secondtextColor)),
        iconTheme:const IconThemeData(color: Themes.secondtextColor),
        scaffoldBackgroundColor: Themes.backgroundColor,
        primarySwatch:Themes.accentColor,
      ),
      builder: (context,child){
        return ScrollConfiguration(
      behavior: MyBehavior(),
      child: child!,
    );
      },
      home: const HomePage()
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}