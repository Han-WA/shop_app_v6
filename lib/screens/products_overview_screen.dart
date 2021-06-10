import 'package:flutter/material.dart';
import 'package:shop_app_v6/models/product.dart';
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
