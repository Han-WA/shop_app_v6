import 'package:flutter/material.dart';
import 'package:shop_app_v6/providers/products_provider.dart';
import 'package:shop_app_v6/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyShop",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          'product_detail_screen': (ctx) => ProductOverviewScreen(),
        },
      ),
    );
  }
}
