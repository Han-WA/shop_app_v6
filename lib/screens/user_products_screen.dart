import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_v6/providers/products_provider.dart';
import 'package:shop_app_v6/widgets/app_drawer.dart';
import 'package:shop_app_v6/widgets/user_product_widget.dart';

import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user_product_screen";

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (context, i) => Column(
            children: [
              UserProductWidget(
                productsData.items[i].title,
                productsData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
