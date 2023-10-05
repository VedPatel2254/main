import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item alog;

  AddToCart({
    required this.alog, required key,
  });

  @override
  Widget build(BuildContext context) {
    // Watch for changes in the cart using VxState
    final CartModel _cart = (VxState.store as MyStore1).cart;
    bool isInCart = _cart.items.contains(alog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // Call the custom AddMutation function to add the item to the cart
          addProductToCart(alog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme as Color?),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }

  // Custom function to add the item to the cart
  void addProductToCart(Item product) {
    final CartModel _cart = (VxState.store as MyStore1).cart;
    _cart.add(product);
  }
}
