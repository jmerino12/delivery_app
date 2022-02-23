import 'package:delivery_app/domain/model/product.dart';
import 'package:delivery_app/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app/presentation/home/products/products_controller.dart';
import 'package:delivery_app/presentation/widgets/delivery_botton.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final controller = Get.put<ProductsController>(
      ProductsController(apiRepositoryInterface: Get.find()));
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Obx(
          () => controller.productsList.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10),
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    final product = controller.productsList[index];
                    return _ItemProduct(
                        product: product,
                        onTap: () {
                          cartController.add(product);
                        });
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ItemProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
            Expanded(
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
                  Text(
                    '\$${product.price} USD',
                    style: TextStyle(
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .labelStyle!
                            .color),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              onTap: onTap,
              text: "Add",
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            )
          ],
        ),
      ),
    );
  }
}
