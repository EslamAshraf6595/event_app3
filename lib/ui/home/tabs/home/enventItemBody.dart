import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class EventItemBody extends StatelessWidget {
  const EventItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      width: width * 0.2,
      height: height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppAssets.birthdayLight,
            ),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.primeColordark,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.01, vertical: height * 0.01),
            width: width * 0.18,
            height: height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.whiteColor,
            ),
            child: Column(
              children: [
                Text(
                  "21",
                  style: AppStyles.inter20prime,
                ),
                Text(
                  "Nov",
                  style: AppStyles.inter14prime,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            height: height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.whiteColor,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "This is a Birthday Party",
                    style: AppStyles.inter14dark,
                  ),
                  IconButton(
                      onPressed: () {
                        //make it favorite
                      },
                      icon: Image.asset(
                        AppAssets.unslectedFavorite,
                        color: AppColor.primeColordark,
                      ))
                ]),
          )
        ],
      ),
    );
  }
}
