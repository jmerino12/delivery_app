import 'package:delivery_app/data/datasource/api_repository_implementation.dart';
import 'package:delivery_app/data/datasource/local_repository_implementation.dart';
import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/main_bloc.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(create: (_) => ApiRespositoryImpl()),
        Provider<LocalRepositoryInterface>(
            create: (_) => LocalRepositoryImpl()),
        ChangeNotifierProvider(create: (context) {
          return MainBLoC(
              localRepositoryInterface:
                  context.read<LocalRepositoryInterface>())
            ..loadTheme();
        })
      ],
      child: Builder(
        builder: (newContext) {
          return Consumer<MainBLoC>(
            builder: (context, bloc, _) {
              return bloc.currentTheme == null
                  ? const SizedBox.shrink()
                  : MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: bloc.currentTheme,
                      home: SplashScreen.init(newContext),
                    );
            },
          );
        },
      ),
    );
  }
}
