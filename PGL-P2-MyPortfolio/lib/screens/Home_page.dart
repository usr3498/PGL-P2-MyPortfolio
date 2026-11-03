import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homePage = Container(
      height: AppPortfolioScreensStyles.screenHeight(context),
      width: AppPortfolioScreensStyles.screenWidth(context),
      color: AppPortfolioScreensStyles.background,
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 2,
          runSpacing: 8,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/islas_home_page.jpg",
                    width: 420,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: const Text(
                      "Sergio Morales Díaz",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        color: Color.fromARGB(246, 253, 250, 250),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: const Text(
                      "CANARIAS +",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        color: AppPortfolioScreensStyles.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: const Text(
                      "Esta aplicación trata sobre descubrir nuestas islas lo maximo posible, por eso incluimos todos los sitios, actividades, experiencias que conocemos de nuestras islas, aqui podras ver lugares que te diran donde es, que experience y podras valorar los que visites como también recomendar sitios que no esten en la aplicación. ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: AppPortfolioScreensStyles.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return homePage;
  }
}
