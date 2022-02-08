import 'package:delivery_app/theme.dart';
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;

  const DeliveryButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.padding = const EdgeInsets.all(14)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: deliveryGradiant,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: padding,
        child: InkWell(
          onTap: onTap,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
