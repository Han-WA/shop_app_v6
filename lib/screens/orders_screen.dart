import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_v6/providers/order_provider.dart';
import 'package:shop_app_v6/widgets/order_item_widget.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders_screen";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => OrderItemWidget(orderData.orders[i]),
      ),
    );
  }
}
