import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onShopping;

  const CartScreen({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart"),
      ),
      body: _EmptyCart(
        onShopping: onShopping,
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;

  const _EmptyCart({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/hamburguesa.jpeg",
          height: 90,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "There are no product",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).inputDecorationTheme.labelStyle!.color),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: RaisedButton(
          onPressed: onShopping,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: DeliveryColors.purple,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Go Shopping",
              style: TextStyle(color: DeliveryColors.white),
            ),
          ),
        ))
      ],
    );
  }
}
