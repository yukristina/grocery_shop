import 'package:flutter/material.dart';
import 'package:groceryshop/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey[600],
          elevation: 0,
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItems.length,
                      padding: EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Image.asset(value.cartItems[index][2]),
                                title: Text(value.cartItems[index][0]),
                                subtitle:
                                    Text('\$' + value.cartItems[index][1]),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                  ),
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                ),
                              ),
                            ));
                      })),

              // TOTAL + PAY NOW
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '\$' + value.calculateTotal(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      // PAY NOW
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          },
        ));
  }
}
