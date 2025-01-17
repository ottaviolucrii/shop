import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/componets/app_drawer.dart';
import 'package:shop/componets/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Meus Pedidos',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
          itemCount: orders.itemsCount,
        ));
  }
}
