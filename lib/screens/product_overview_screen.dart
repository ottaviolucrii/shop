import 'package:flutter/material.dart';
import 'package:shop/componets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
          style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ProductGrid(),
    );
  }
}


