import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/models/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
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
      
      ),
    );
  }
}