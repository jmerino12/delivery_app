import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/model/product_cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;
  RxInt totalItem = 0.obs;

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

    final total = temp.fold(
        0,
        (previousValue, element) =>
            element.quantity + int.parse(previousValue.toString()));
    totalItem(total);
  }

  void remove(Product product) {}
}
