import 'package:delivery_app/data/in_memory_product.dart';
import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

import '../../widgets/delivery_botton.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onShopping;

  const CartScreen({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping cart"),
        ),
        body: _FullCart());
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemExtent: 230,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _ShoppingCardProduct(
                    product: products[index],
                  );
                }),
          ),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).canvasColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sub total",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .labelStyle!
                                              .color)),
                              Text("0.0 USD",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .labelStyle!
                                              .color)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .inputDecorationTheme
                                            .labelStyle!
                                            .color),
                              ),
                              Text("free",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .labelStyle!
                                              .color)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle!
                                        .color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("\$85.00 USD",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle!
                                          .color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    DeliveryButton(onTap: () {}, text: "Checkout")
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class _ShoppingCardProduct extends StatelessWidget {
  final Product product;
  const _ShoppingCardProduct({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).canvasColor,
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      child: ClipOval(
                          child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      )),
                      backgroundColor: Colors.black,
                    )),
                const SizedBox(height: 5),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(product.name),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description,
                        style: Theme.of(context)
                            .textTheme
                            .overline!
                            .copyWith(color: DeliveryColors.ligthGrey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: DeliveryColors.white,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(
                                  Icons.remove,
                                  color: DeliveryColors.purple,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("2"),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: DeliveryColors.purple,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Icon(Icons.add,
                                    color: DeliveryColors.white),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(color: DeliveryColors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ))
      ]),
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
