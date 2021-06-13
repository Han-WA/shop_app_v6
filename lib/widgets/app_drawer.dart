import 'package:flutter/material.dart';
import 'package:shop_app_v6/screens/orders_screen.dart';
import 'package:shop_app_v6/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello Friend!"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            leading: Icon(Icons.shop),
            title: Text("Shop"),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            leading: Icon(Icons.payment),
            title: Text("Orders"),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
            leading: Icon(Icons.edit),
            title: Text("Manage Products"),
          ),
        ],
      ),
    );
  }
}
