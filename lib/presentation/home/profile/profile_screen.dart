import 'package:delivery_app/domain/repository/api_repository.dart';
import 'package:delivery_app/domain/repository/local_storage_repository.dart';
import 'package:delivery_app/main_bloc.dart';
import 'package:delivery_app/presentation/home/home_bloc.dart';
import 'package:delivery_app/presentation/home/profile/profile_bloc.dart';
import 'package:delivery_app/presentation/splash/splash_screen.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileBLoC(
          apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
          localRepositoryInterface: context.read<LocalRepositoryInterface>())
        ..loadTheme(),
      builder: (_, __) => ProfileScreen._(),
    );
  }

  Future<void> logout(BuildContext context) async {
    final profileBloc = Provider.of<ProfileBLoC>(context, listen: false);
    await profileBloc.logout();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => SplashScreen.init(context)),
        (route) => false);
  }

  void onThemeUpdated(bool isDark, BuildContext context) {
    final profileBloc = Provider.of<ProfileBLoC>(context, listen: false);
    profileBloc.updateTheme(isDark);
    //TODO: update global theme
    final mainBloc = Provider.of<MainBLoC>(context);
    mainBloc.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBLoC>(context);
    final profileBloc = Provider.of<ProfileBLoC>(context);
    final user = homeBloc.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: user?.image != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: DeliveryColors.green),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(user!.image!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .labelStyle!
                              .color),
                    )
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Card(
                            color: Theme.of(context).canvasColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Personal Information',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle!
                                          .color),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'E-mail',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: DeliveryColors.green),
                                      ),
                                      Text(
                                        '${user.name}@gmail.com'
                                            .trim()
                                            .toLowerCase(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          const Text("Dark mode"),
                                          const Spacer(),
                                          Switch(
                                              value: profileBloc.isDark,
                                              onChanged: (val) =>
                                                  onThemeUpdated(val, context),
                                              activeColor:
                                                  DeliveryColors.purple),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: RaisedButton(
                            onPressed: () => logout(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: DeliveryColors.purple,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Log out",
                                style: TextStyle(color: DeliveryColors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
