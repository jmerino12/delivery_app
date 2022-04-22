import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_bloc.dart';
import 'package:delivery_app/presentation/widgets/delivery_botton.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

const logoSize = 50.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBLoC(
          apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
          localRepositoryInterface: context.read<LocalRepositoryInterface>()),
      builder: (_, __) => LoginScreen._(),
    );
  }

  void login(BuildContext context) async {
    final loginBloc = context.read<LoginBLoC>();
    final result = await loginBloc.login();
    if (result) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen.init(context)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error en el login')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const moreSize = 50.0;
    final bloc = context.watch<LoginBLoC>();
    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: deliveryGradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.5, 1.0]),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(size.width / 2))),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                          radius: logoSize,
                          backgroundColor: Theme.of(context).canvasColor,
                          child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                'assets/logo.png',
                                color: Theme.of(context).colorScheme.secondary,
                              ))))
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Login",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Username",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle!
                                  .color),
                        ),
                        TextField(
                          controller: bloc.usernameTextController,
                          decoration: InputDecoration(
                              hintText: "username",
                              prefixIcon: Icon(Icons.person_outline,
                                  color: Theme.of(context).iconTheme.color)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Password",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle!
                                  .color),
                        ),
                        TextField(
                          controller: bloc.passwordTextController,
                          decoration: InputDecoration(
                              hintText: "password",
                              prefixIcon: Icon(
                                Icons.lock_clock_sharp,
                                color: Theme.of(context).iconTheme.color!,
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  text: 'Login',
                  onTap: () => login(context),
                ))
          ],
        ),
        Positioned.fill(
            child: (bloc.loginState == LoginState.loading)
                ? Container(
                    color: Colors.black26,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink())
      ]),
    );
  }
}
