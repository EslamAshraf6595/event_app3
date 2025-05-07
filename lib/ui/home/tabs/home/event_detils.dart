import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/ui/home/provider/current_event_provider.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/home/tabs/home/edit_event_data.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetils extends StatelessWidget {
  EventDetils({
    super.key,
  });
  static const routeDetails = 'eventdetails';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var currentEventProvider = Provider.of<CurrentEventProvider>(context);
    final dateTime = currentEventProvider.currentEvent!.dateTime as DateTime;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeProvider.courrentThem == ThemeMode.light
              ? AppColor.whiteColor
              : AppColor.mainColordark,
          title: Row(
            children: [
              Center(
                child: Text(
                  'Event Detials',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditEventData(
                          event: currentEventProvider.currentEvent!),
                    ),
                  );
                },
                icon: Icon(
                  Icons.draw,
                  size: 25,
                ),
              ),
              IconButton(
                  onPressed: () {
                    //delete
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                  )),
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(currentEventProvider
                    .currentEvent!.image), //get the event image
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                currentEventProvider.currentEvent!.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: Row(
                  children: [
                    Image.asset(AppAssets.calinder),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat("dd/MM/yyyy").format(dateTime),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          currentEventProvider.currentEvent!.time.toString(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.primeColordark),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          // choose location
                        },
                        icon: Image.asset(AppAssets.imageLocation)),
                    SizedBox(width: width * 0.01),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: TextStyle(color: AppColor.primeColordark),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: IconButton(
                          onPressed: () {
                            // navigate or confirm location
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined)),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(AppAssets.mapImage),
              ),
              Text(
                AppLocalizations.of(context)!.description_label + " : ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: height * 0.0),
              Text(
                currentEventProvider.currentEvent!.description,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  void NothingToDo() {}
}
