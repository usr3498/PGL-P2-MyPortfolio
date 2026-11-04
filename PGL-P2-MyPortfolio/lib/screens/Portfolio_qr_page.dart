import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/Portfolio_home_page.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Portfolio_screens_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Header_porfolio.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/footer_portfolio.dart';

class PortfolioQrPage extends StatelessWidget {
  const PortfolioQrPage({super.key});

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/brave_logo.webp",
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "A mi me gusta más Brave",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          color: AppPortfolioScreensStyles.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppPortfolioScreensStyles.textColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: QrImageView(
                          data:
                              "https://github.com/usr3498/Navegaci-n_pantallas-UD2-T2_Moviles",
                          version: QrVersions.auto,
                          size: 200.0,
                          backgroundColor: Colors.white,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Colors.black,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(
            onMainPage: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const PortfolioHomePage(),
                ),
              );
            },
            onSecondPage: () {
            },
          ),
        ],
      ),
    );
  }
}