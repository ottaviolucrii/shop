import 'package:flutter/material.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.white),
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
      routes: {
        AppRoutes.PRODUCT_DETAIL : (ctx) => ProductDetailScreen(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}