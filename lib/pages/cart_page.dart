import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Shoe> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      );
    }

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final shoe = cartItems[index];
        return ListTile(
          leading: Image.asset(shoe.imagePath, width: 56, height: 56),
          title: Text(shoe.name),
          subtitle: Text(shoe.description),
          trailing: Text('\$${shoe.price}'),
        );
      },
    );
  }
}
