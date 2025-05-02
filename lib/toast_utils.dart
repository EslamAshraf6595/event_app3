import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static Future<bool?> toastMassage(
      {required Color backGroundColor,
      required Color textColor,
      required String massage}) {
    return Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backGroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }
}
