import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  GroceryItemTile(
      {Key? key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.onPressed,
      this.color})
      : super(key: key);

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              imagePath,
              height: 64,
            ),

            // item name
            Text(itemName),

            // price + button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
