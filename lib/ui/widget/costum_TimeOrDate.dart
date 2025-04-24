import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CostumTimeordate extends StatelessWidget {
  CostumTimeordate(
      {super.key,
      required this.eventTimeOrDate,
      required this.timeOrDate,
      required this.icon,
      required this.ChooseDataOrTime});
  Function ChooseDataOrTime;
  IconData icon;
  String timeOrDate;
  String eventTimeOrDate;
  @override
  Widget build(BuildContext context) {
    var themeProvidet = Provider.of<ThemeProvider>(context);
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: themeProvidet.courrentThem == ThemeMode.dark
              ? AppColor.whiteColor
              : AppColor.colorBlack,
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          timeOrDate,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 13),
        ),
        Spacer(),
        TextButton(
            onPressed: () {
              ChooseDataOrTime();
            },
            child: Text(
              eventTimeOrDate,
              style: AppStyles.inter14blue,
            ))
      ],
    );
  }
}
