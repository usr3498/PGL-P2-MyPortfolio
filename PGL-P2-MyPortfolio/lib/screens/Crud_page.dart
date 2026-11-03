import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/Crud_elemet_list_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/Drawer.dart';

class CrudPage extends StatelessWidget {
  static const List<String> _placeList = [
    "La caldera",
    "Bajamar",
    "Las mesas",
    "Teresitas",
    "La salinas",
    "Siam Park",
    "Las gaviotas",
    "Punta de teno",
  ];

  const CrudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
      ),
      body: Container(
        width: double.infinity,
        color: AppPortfolioScreensStyles.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const Text(
                "Sergio Morales Díaz",
                style: TextStyle(
                  fontSize: 24,
                  color: AppPortfolioScreensStyles.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ..._placeList.map(
                (place) => CrudElemetList(
                  text: place,
                  margin: const EdgeInsets.only(bottom: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}