import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/presentation/home/home_screen.dart';
import 'package:delivery_app/presentation/login/login_screen.dart';
import 'package:delivery_app/presentation/splash/splash_bloc.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBLoC(
          apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
          localRepositoryInterface: context.read<LocalRepositoryInterface>()),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    final bloc = context.read<SplashBLoC>();
    final result = await bloc.validateSession();
    if (result) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen.init(context)));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginScreen.init(context)));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: deliveryGradiant)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: DeliveryColors.white,
              child: Padding(
                child: Image.asset("assets/logo.png"),
                padding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Delivery App",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
