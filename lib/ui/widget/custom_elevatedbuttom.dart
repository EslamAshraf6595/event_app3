import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedbuttom extends StatelessWidget {
  
  CustomElevatedbuttom(
      {super.key, required this.text, required this.onButtonClick()});
  String text;
  Function onButtonClick;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        onButtonClick();
        //update Event
      },
      child: Text(
        text,
        style: AppStyles.bold20white,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blue,
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
