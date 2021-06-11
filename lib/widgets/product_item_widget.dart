import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_v6/screens/products_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_v6/providers/product.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          ),
          title: Text(
            product.title,
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
