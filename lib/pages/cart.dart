import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';
import '../modules/cart/cart_cubit.dart';
import '../widgets/bottomNavBar.dart';
import 'checkout.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using "watch" instead of "select" to rebuild the widget when the state changes
    final cartItems = context.watch<CartCubit>().state;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            leading: Image.network(
              'http://192.168.8.108:8000${cartItem.product.thumbnail}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cartItem.product.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: KES ${cartItem.product.price}'),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quantity: ${cartItem.quantity}'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context).incrementItem(cartItem);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CartCubit>(context).decrementItem(cartItem);
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                BlocProvider.of<CartCubit>(context).removeItem(cartItem);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      )
          : const Center(
        child: Text('Your cart is empty'),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Background color
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CheckoutPage()));
        },
        child: const Text('Checkout'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
