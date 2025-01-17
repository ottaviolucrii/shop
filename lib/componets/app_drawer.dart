import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/providers/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;

    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text(
              'Welcome, User!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop, color: iconColor),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: iconColor),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
          const Divider(),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) => SwitchListTile(
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
              activeTrackColor: Colors.green,
              activeColor: Colors.black,
              title: const Text('Dark Mode'),
              secondary: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: iconColor,
              ),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
