import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app_v6/providers/cart_provider.dart';
import 'package:shop_app_v6/providers/product.dart';
import 'package:shop_app_v6/providers/products_provider.dart';
import 'package:shop_app_v6/screens/cart_screen.dart';
import 'package:shop_app_v6/widgets/badge.dart';
import 'file:///D:/All%20about%20Flutter/flutter_2021/shop_app_v6/lib/providers/product.dart';
import 'package:shop_app_v6/widgets/product_grid_widget.dart';
import 'package:shop_app_v6/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<CartProvider>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (_, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
          ),
        ],
      ),
      body: ProductsGridWidget(_showOnlyFavorites),
    );
  }
}
