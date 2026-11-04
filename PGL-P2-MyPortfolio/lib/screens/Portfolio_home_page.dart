import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Portfolio_screens_style.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/portfolio_colored_box.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/portfolio_qr_page.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/header_porfolio.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/footer_portfolio.dart';

class PortfolioHomePage extends StatelessWidget {
  static const List<String> _hobbiesList = [
    "Gimnasio",
    "Baloncesto",
    "Robótica",
    "Programación",
    "Música",
    "Videojuegos",
    "Anime",
    "Peliculas",
    "Montaña",
    "Playa",
    "Leer",
    "Pasear",
  ];

  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
      ),
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppPortfolioScreensStyles.background,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 2,
                  runSpacing: 8,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/foto_curriculum.webp",
                            width: 180,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            "Estudiante de programación que también apasionado por la IA y ciberseguridad. Aparte estos son mis jobies:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: AppPortfolioScreensStyles.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ..._hobbiesList.map(
                      (hobby) => MyColoredBox(
                        text: hobby,
                        fontSize: 18,
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/shrek_main.webp",
                            width: 180,
                            fit: BoxFit.contain,
                          ),
                          const Text(
                            "Yo viendo mi código",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 30,
                              color: AppPortfolioScreensStyles.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Footer(
            onMainPage: () {
              // Ya estás en Portfolio Home, no hace falta navegar
            },
            onSecondPage: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const PortfolioQrPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
