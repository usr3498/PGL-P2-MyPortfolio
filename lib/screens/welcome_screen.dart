import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/Home_page.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
      ),
      body: const homePage(),
    );
  }
}