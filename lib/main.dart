import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/theme_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.white),
              fontFamily: 'Lato',
              iconTheme: IconThemeData(color: Colors.black), // Ícones pretos no modo claro
            ),
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark().copyWith(secondary: Colors.white),
              iconTheme: IconThemeData(color: Colors.white), // Ícones brancos no modo escuro
            ),
            themeMode: themeProvider.themeMode,
            routes: {
              AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
              AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
              AppRoutes.CART: (ctx) => CartScreen(),
              AppRoutes.ORDERS: (ctx) => OrdersScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}