import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    // [itenName, itemPrice, imagePath, color]
    ['Avocado', '4.00', 'lib/assets/avocado.png', Colors.green],
    ['Banana', '2.50', 'lib/assets/banana.png', Colors.yellow],
    ['Chicken', '12.80', 'lib/assets/chicken.png', Colors.brown],
    ['Water', '1.00', 'lib/assets/water.png', Colors.blue],
  ];

  // LIST OF CART ITEMS
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // ADD ITEMS TO CART
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // REMOVE ITEMS FROM CART
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // CALCULATE TOTAL PRICE
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
