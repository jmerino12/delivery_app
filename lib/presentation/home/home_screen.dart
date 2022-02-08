import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: IndexedStack(
            index: currentIndex,
            children: [
              ProductsScreen(),
              Text('currentInd: $currentIndex'),
              CartScreen(
                onShopping: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
              Text('currentInd: $currentIndex'),
              ProfileScreen()
            ],
          )),
          _DeliveryNavigationBar(
              index: currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              })
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;
  const _DeliveryNavigationBar(
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
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
