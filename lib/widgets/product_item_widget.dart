import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_v6/screens/products_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItemWidget(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.favorite),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
