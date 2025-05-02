import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/ui/home/provider/eventsProvider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItemBody extends StatelessWidget {
  EventItemBody({super.key, required this.event});
  Event event;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventsProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      width: width * 0.2,
      height: height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              event.image,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  // event.dateTime.day.toString(),
                  DateFormat.d().format(event.dateTime),
                  style: AppStyles.inter20prime,
                ),
                Text(
                  // event.dateTime.month.toString(),
                  DateFormat.MMMM().format(event.dateTime),
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
                    event.title,
                    style: AppStyles.inter14dark,
                  ),
                  IconButton(
                      onPressed: () {
                        //make it favorite
                        eventListProvider.updateIsFavoriteItem(
                            event, context, userProvider.currentUser!.id ?? '');
                      },
                      icon: Image.asset(
                        event.isFavorite == true
                            ? AppAssets.slectedFavorite
                            : AppAssets.unslectedFavorite,
                        color: AppColor.primeColordark,
                      ))
                ]),
          )
        ],
      ),
    );
  }
}
