import 'package:flutter/material.dart';
import 'file:///D:/All%20about%20Flutter/flutter_2021/shop_app_v6/lib/providers/product.dart';
import 'package:shop_app_v6/widgets/product_grid_widget.dart';
import 'package:shop_app_v6/widgets/product_item_widget.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: ProductsGridWidget(),
    );
  }
}
