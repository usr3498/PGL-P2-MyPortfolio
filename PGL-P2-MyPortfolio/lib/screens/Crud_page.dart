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
      body: Column(
        children: [
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
                          const Text(
                            "Sergio Morales Díaz",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 24,
                              color: AppPortfolioScreensStyles.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ..._placeList.map(
                      (hobby) => CrudElemetList(
                        text: hobby,
                        fontSize: 18,
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
