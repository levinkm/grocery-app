import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerygo/modules/cart/cart_cubit.dart';

import '../constants.dart';
import '../models/cart_item.dart';
import 'home.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = context.select<CartCubit, List<CartItem>>((cubit) => cubit.state);
    final total = cartItems.fold<double>(0, (previousValue, item) => previousValue + item.product.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please enter your payment details'),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name on card',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Card number',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Expiration date',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'CVV',
            ),
          ),
          const SizedBox(height: 16),
          Text('Total: KES ${total.toStringAsFixed(2)}'),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, // Background color
            ),
            onPressed: () {
              // TODO: Implement payment processing logic
              BlocProvider.of<CartCubit>(context).clearCart();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
              //Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('Submit payment'),
          ),
        ],
      ),
    );
  }
}
