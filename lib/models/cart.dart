import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';


class Cart with ChangeNotifier{

  Map<String, CartItem> _items ={};
  Map<String, CartItem> get items => {..._items};

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clearList(){
    _items = {};
    notifyListeners();
  }
  
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount{
    return _items.length;
  }

  void addItem(Product product){
    if(_items.containsKey(product.id)){
      _items.update(product.id, (existingCartItem) => CartItem(
        id: existingCartItem.id,
        productId: existingCartItem.productId,
        name: existingCartItem.name,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1,
      ));
    }else{
      _items.putIfAbsent(product.id, () => CartItem(
        id: Random().nextDouble().toString(),
        productId: product.id,
        name: product.name,
        price: product.price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }
}