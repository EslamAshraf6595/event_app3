import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EventTabBarItem extends StatelessWidget {
  EventTabBarItem({
    super.key,
    required this.isSlected,
    required this.eventText,
    required this.iconData,
    required this.bodyColor,
    this.borderColor,
    required this.slectedColor,
    required this.unslectedColor,
    required this.iconSlectedColor,
    required this.iconUnslectedColor,
  });
  Color? bodyColor, borderColor, iconSlectedColor, iconUnslectedColor;
  TextStyle slectedColor, unslectedColor;
  bool isSlected;
  String eventText;
  String iconData;
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.02),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            color: isSlected ? bodyColor : Colors.transparent,
            border: Border.all(
              color: borderColor ?? AppColor.whiteColor,
              width: 1,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage(iconData), // Or FontAwesome.compass or LineAwesome.compass_solid
                  size: 15,
                  color: isSlected ? iconSlectedColor : iconUnslectedColor,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  eventText,
                  style: isSlected ? slectedColor : unslectedColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
