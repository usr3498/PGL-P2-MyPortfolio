import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/home_page.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/app_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: AppPortfolioScreensStyles.background,
          foregroundColor: AppPortfolioScreensStyles.textColor,
        ),
        body: const homePage(),
      ),
    );
  }
}