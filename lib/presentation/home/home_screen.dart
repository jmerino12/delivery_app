import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/cart/cart_bloc.dart';
import 'package:delivery_app/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app/presentation/home/home_bloc.dart';
import 'package:delivery_app/presentation/home/products/products_bloc.dart';
import 'package:delivery_app/presentation/home/products/products_screen.dart';
import 'package:delivery_app/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeBLoC(
          apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
          localRepositoryInterface: context.read<LocalRepositoryInterface>())
        ..loadUser(),
      builder: (_, __) => HomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                ProductsScreen.init(context),
                const Placeholder(),
                CartScreen(
                  onShopping: () {
                    bloc.updateIndexSelected(0);
                  },
                ),
                const Placeholder(),
                ProfileScreen.init(context)
              ],
            ),
          ),
          _DeliveryNavigationBar(
              index: bloc.indexSelected,
              onIndexSelected: (index) {
                bloc.updateIndexSelected(index);
              }),
        ],
      ),
    );
  }
}

class _DeliveryNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  _DeliveryNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context);
    final cartBloc = Provider.of<CartBLoC>(context);
    final user = bloc.user;

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
                child: Stack(
                  children: [
                    CircleAvatar(
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
                    Positioned(
                      child: cartBloc.totalItem == 0
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.pinkAccent,
                              child: Text(
                                cartBloc.totalItem.toString(),
                              ),
                            ),
                      right: 0,
                    )
                  ],
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
                child: user.image == null
                    ? const SizedBox.shrink()
                    : CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(user.image!),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
