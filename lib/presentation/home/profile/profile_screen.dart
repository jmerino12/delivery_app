import 'package:delivery_app/presentation/home/home_bloc.dart';
import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.find<HomeBLoC>();

  Future<void> logout() async {
    //await controller.logout();
    //Get.offAllNamed(DeliveryRoutes.splash);
  }

  void onThemeUpdated(bool isDark) {
//controller.updateTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : ligthTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.user;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: user.image != null
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
                            shape: BoxShape.circle,
                            color: DeliveryColors.green),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(user.image!),
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
                                          '${user.name!.removeAllWhitespace}@gmail.com'
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
                                            Obx(
                                              () => Switch(
                                                  value: true,
                                                  onChanged: onThemeUpdated,
                                                  activeColor:
                                                      DeliveryColors.purple),
                                            )
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
                              onPressed: logout,
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
    });
  }
}
