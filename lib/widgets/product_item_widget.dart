import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_v6/providers/cart_provider.dart';
import 'package:shop_app_v6/screens/products_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_v6/providers/product.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

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
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added item to the card"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                    label: "UNDO",
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
