import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_v6/models/product.dart';
import 'package:shop_app_v6/providers/products_provider.dart';
import 'package:shop_app_v6/widgets/product_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) => ProductItemWidget(
        products[i].id,
        products[i].title,
        products[i].imageUrl,
      ),
    );
  }
}
