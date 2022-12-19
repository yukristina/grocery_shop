import 'package:flutter/material.dart';
import 'package:groceryshop/models/cart_model.dart';
import 'package:groceryshop/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
      );
  }
}
