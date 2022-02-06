import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const logoSize = 50.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    const moreSize = 50.0;
    return Scaffold(
      body: Column(
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
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: deliveryGradiant,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
