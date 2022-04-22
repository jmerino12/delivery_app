import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:flutter/material.dart';

class CartBLoC extends ChangeNotifier {
  List<ProductCart> cartList = <ProductCart>[];
  int totalItem = 0;
  double totalPrice = 0.0;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product));
    }
    cartList = List<ProductCart>.from(temp);
    calculateTotal(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList = List<ProductCart>.from(cartList);
    calculateTotal(cartList);
  }

  void removeQuantity(ProductCart product) {
    product.quantity -= 1;
    cartList = List<ProductCart>.from(cartList);
    calculateTotal(cartList);
  }

  void calculateTotal(List<ProductCart> temp) {
    final total = temp.fold(
        0,
        (previousValue, element) =>
            element.quantity + int.parse(previousValue.toString()));
    final price = temp.fold(
        0.0,
        (previousValue, element) =>
            (element.quantity * element.product.price) +
            double.parse(previousValue.toString()));
    totalItem = total;
    totalPrice = price;
    notifyListeners();
  }

  void remove(ProductCart product) {
    cartList.remove(product);
    calculateTotal(cartList);
  }
}
