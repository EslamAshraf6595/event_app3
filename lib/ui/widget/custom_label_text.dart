import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  DescriptionText({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 15),
    );
  }
}
