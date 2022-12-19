import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryshop/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_items_tile.dart';
import 'cart_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage())),
          backgroundColor: Colors.black,
          child: Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 48,
            ),
            // GOOD MORNING
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good morning,'),
            ),

            SizedBox(
              height: 4,
            ),

            // LET'S ORDER FRESH ITEMS FOR YOU
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Let\'s order fresh items for you',
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),

            // DIVIDER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Divider(),
            ),

            SizedBox(
              height: 24,
            ),

            // FRESH ITEMS + GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh Items',
                style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    });
              },
            )),
          ]),
        ));
  }
}
