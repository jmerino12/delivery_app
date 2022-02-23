import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItem = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList.value);
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
    cartList.value = List<ProductCart>.from(temp);
    calculateTotal(temp);
  }

  void increment(ProductCart productCart) {
    productCart.quantity += 1;
    cartList.value = List<ProductCart>.from(cartList.value);
    calculateTotal(cartList.value);
  }

  void removeQuantity(ProductCart product) {
    product.quantity -= 1;
    cartList.value = List<ProductCart>.from(cartList.value);
    calculateTotal(cartList.value);
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
    totalItem(total);
    totalPrice(price);
  }

  void remove(ProductCart product) {
    cartList.remove(product);
    calculateTotal(cartList.value);
  }
}
