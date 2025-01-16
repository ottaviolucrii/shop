import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ), 
        leading: IconButton(
          icon: Icon(
            product.isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            product.toggleFavorite();
          },
          color: Theme.of(context).colorScheme.secondary,
        ), 
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
          color: Theme.of(context).colorScheme.secondary,
        ),
       ),
    );
  }
}
