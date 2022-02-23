import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  late final ApiRepositoryInterface apiRepositoryInterface;

  ProductsController({required this.apiRepositoryInterface});

  RxList<Product> productsList = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProduct();
    productsList.value = result;
  }
}
