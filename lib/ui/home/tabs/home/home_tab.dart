import 'package:event_planing_app/ui/home/provider/current_event_provider.dart';
import 'package:event_planing_app/ui/home/provider/eventsProvider.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
import 'package:event_planing_app/ui/home/tabs/home/enventItemBody.dart';
import 'package:event_planing_app/ui/home/tabs/home/eventTabItem.dart';
import 'package:event_planing_app/ui/home/tabs/home/event_detils.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});
  int slectedTab = 0;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

late EventsProvider enevtListProvider;

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var currentEventProvider = Provider.of<CurrentEventProvider>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> eventIconsList = [
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      // Bootstrap.bicycle,
      // Bootstrap.gift,
      // Bootstrap.calendar_event,
      // Bootstrap.controller,
      // Bootstrap.briefcase,
      // Bootstrap.book,
      // Bootstrap.image,
      // Bootstrap.sun,
      // Bootstrap.basket,
    ];

    enevtListProvider = Provider.of<EventsProvider>(context);
    enevtListProvider.getEventNameList(context);
    if (enevtListProvider.listEvent.isEmpty) {
      enevtListProvider.getAllEvents(userProvider.currentUser!.id ?? '');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcom,
                  style: AppStyles.regular14white,
                ),
                Text(
                  userProvider.currentUser!.name ?? '',
                  style: AppStyles.inter24white,
                )
              ],
            ),
            Spacer(),
            Image.asset(
              AppAssets.iconTheme,
              color: AppColor.whiteColor,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.whiteColor,
              ),
              child: Text(
                languageProvider.currentLanguage.toUpperCase(),
                style: AppStyles.bold14primedark,
              ),
            )
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.unslectedMap,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: AppStyles.bold14white,
                    )
                  ],
                ),
                DefaultTabController(
                  length: enevtListProvider.eventsNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      enevtListProvider.changeSlectedIndex(
                          index, userProvider.currentUser!.id ?? '');
                      setState(() {
                        widget.slectedTab = index;
                      });
                    },
                    labelPadding: EdgeInsets.zero,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    tabs: enevtListProvider.eventsNameList
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      String eventName = entry.value;
                      return EventTabBarItem(
                        iconSlectedColor: Theme.of(context).iconTheme.color,
                        iconUnslectedColor: AppColor.whiteColor,

                        slectedColor:
                            Theme.of(context).textTheme.headlineSmall!,
                        unslectedColor: AppStyles.inter16white,

                        //AppStyles.inter16white,
                        bodyColor: Theme.of(context).focusColor,
                        eventText: eventName,
                        isSlected: widget.slectedTab == index,
                        iconData: eventIconsList[index], // 👈 here
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: enevtListProvider.filterList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_event,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.015),
                        child: GestureDetector(
                          onTap: () {
                            currentEventProvider.getCurrentEvent(
                              enevtListProvider.filterList[index],
                            );
                            Navigator.of(context).pushNamed(
                              EventDetils.routeDetails,
                            );
                          },
                          child: EventItemBody(
                            event: enevtListProvider.filterList[index],
                          ),
                        ),
                      );
                    },
                    itemCount: enevtListProvider.filterList.length,
                  ),
          )
        ],
      ),
    );
  }
}
