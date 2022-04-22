import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:flutter/material.dart';

class ProductsBLoC extends ChangeNotifier {
  late final ApiRepositoryInterface apiRepositoryInterface;

  ProductsBLoC({required this.apiRepositoryInterface});

  List<Product> productsList = <Product>[];

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProduct();
    productsList = result;
    notifyListeners();
  }
}
