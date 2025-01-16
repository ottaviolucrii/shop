import 'package:flutter/material.dart';
import 'package:shop/componets/product_item.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10), 
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        ),
      ),
    );
  }
}
