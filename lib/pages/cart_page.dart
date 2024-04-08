import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/components/my_buttion.dart';
import 'package:food_app/components/my_cart_title.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      //UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(
                                'Are you sure you want to clear the cart?'),
                            actions: [
                              // Cancel button
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel')),
                              // yes button
                              TextButton(
                                  onPressed: () {
                                    restaurant.clearCart();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'))
                            ],
                          ));
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text('Cart is empty'),
                        ))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, i) {
                                final cartItem = userCart[i];
                                return MyCartTitle(cartItem: cartItem);
                              }))
                ],
              ),
            ),
            //Button to pay

            userCart.isNotEmpty
                ? MyButton(
                    text: 'Go to checkout',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentPage()));
                    })
                : const Text(''),

            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}
