import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/home_controller.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Obx(
            () => IndexedStack(
              index: controller.indexSelected.value,
              children: [
                ProductsScreen(),
                const Placeholder(),
                CartScreen(
                  onShopping: () {},
                ),
                const Placeholder(),
                ProfileScreen()
              ],
            ),
          )),
          Obx(
            () => _DeliveryNavigationBar(
                index: controller.indexSelected.value,
                onIndexSelected: (index) {
                  controller.updateIndexSelected(index);
                }),
          )
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  _DeliveryNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).bottomAppBarColor, width: 2),
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).canvasColor),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.ligthGrey,
                  icon: Icon(Icons.home),
                  onPressed: () => onIndexSelected(0),
                ),
              ),
              Material(
                child: IconButton(
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.ligthGrey,
                  icon: Icon(Icons.store),
                  onPressed: () => onIndexSelected(1),
                ),
              ),
              Material(
                child: CircleAvatar(
                  backgroundColor: DeliveryColors.purple,
                  radius: 23,
                  child: IconButton(
                    color: index == 2
                        ? DeliveryColors.white
                        : DeliveryColors.ligthGrey,
                    icon: Icon(Icons.shopping_basket),
                    onPressed: () => onIndexSelected(2),
                  ),
                ),
              ),
              Material(
                child: IconButton(
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.ligthGrey,
                  icon: Icon(Icons.favorite_border),
                  onPressed: () => onIndexSelected(3),
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: Obx(() {
                  final user = controller.user.value;
                  return user.image == null
                      ? const SizedBox.shrink()
                      : CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(user.image!),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
