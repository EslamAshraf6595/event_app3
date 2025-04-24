import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      focusColor: AppColor.whiteColor,
      textTheme: TextTheme(
        headlineLarge: AppStyles.inter20prime,
        headlineMedium: AppStyles.bold20black,
        headlineSmall: AppStyles.meduim16dark,
      ),
      iconTheme: IconThemeData(color: AppColor.primeColordark),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.mainColordark,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.primeColordark)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: AppColor.primeColordark,
          shape: StadiumBorder(
            side: BorderSide(color: AppColor.whiteColor, width: 4),
          )
          // RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(35),
          //   side: BorderSide(
          //     color: AppColor.whiteColor,
          //     width: 4
          //   )
          // ),

          ),
      primaryColor: AppColor.primeColordark,
      scaffoldBackgroundColor: Colors.white);

  static final ThemeData darktTheme = ThemeData(
      focusColor: AppColor.primeColordark,
      textTheme: TextTheme(
        headlineLarge: AppStyles.inter20prime,
        headlineMedium: AppStyles.bold20white,
        headlineSmall: AppStyles.inter16white,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primeColordark,
          iconTheme: IconThemeData(color: AppColor.primeColordark)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.colorBlack,
          elevation: 0,
          shape: StadiumBorder(
            side: BorderSide(color: AppColor.whiteColor, width: 4),
          )
          // RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(35),
          //   side: BorderSide(
          //     color: AppColor.whiteColor,
          //     width: 4
          //   )
          // ),

          ),
      iconTheme: IconThemeData(color: AppColor.whiteColor),
      primaryColor: AppColor.mainColordark,
      scaffoldBackgroundColor: AppColor.mainColordark);
}
