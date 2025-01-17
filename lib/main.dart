import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductList(),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => OrderList()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.white),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.HOME : (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL : (ctx) => ProductDetailScreen(),
          AppRoutes.CART : (ctx) => CartScreen(),
          AppRoutes.ORDERS : (ctx) => OrdersScreen(),
        },
        debugShowCheckedModeBanner: false,
      
      ),
    );
  }
}