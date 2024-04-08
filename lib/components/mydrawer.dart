import 'package:flutter/material.dart';
import 'package:food_app/components/my_drawer_title.dart';
import 'package:food_app/pages/homepage/home_page.dart';
import 'package:food_app/pages/settings/settings_page.dart';
import 'package:food_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      final authService = AuthService();
      authService.signOut();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Icon(
                Icons.lock_open_rounded,
                size: 80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // home title
          MyDrawerTitle(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }),
          // Settings list title
          MyDrawerTitle(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }),
          const Spacer(),
          //logout list title
          MyDrawerTitle(
              text: 'L O G O U T', icon: Icons.logout_sharp, onTap: logout),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
