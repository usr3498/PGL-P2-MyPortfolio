import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_drawer_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/Portfolio_home_page.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/Crud_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppDrawerDark.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppDrawerDark.background,
            ),
            child: const Text(
              'Menú',
              style: TextStyle(
                color: AppDrawerDark.textColor,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppDrawerDark.textColor),
            title: const Text(
              'Home',
              style: TextStyle(color: AppDrawerDark.textColor),
            ),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); 
              navigator.popUntil((route) => route.isFirst); 
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppDrawerDark.textColor),
            title: const Text(
              'Portfolio',
              style: TextStyle(color: AppDrawerDark.textColor),
            ),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); 
              navigator.popUntil((route) => route.isFirst); 
              navigator.push(
                MaterialPageRoute<void>(
                  builder: (_) => const PortfolioHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark, color: AppDrawerDark.textColor),
            title: const Text(
              'Sitios favoritos',
              style: TextStyle(color: AppDrawerDark.textColor),
            ),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); // cierra el drawer
              navigator.popUntil((route) => route.isFirst);
              navigator.push(
                MaterialPageRoute<void>(
                  builder: (_) => const CrudPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}