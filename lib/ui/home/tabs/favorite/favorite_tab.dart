import 'package:event_planing_app/ui/home/provider/eventsProvider.dart';
import 'package:event_planing_app/ui/widget/custom_textForm_field.dart';
import 'package:event_planing_app/ui/home/tabs/home/eventItemBody.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var eventListProvider = Provider.of<EventsProvider>(context);

    if (eventListProvider.favoriteEventList.isEmpty) {
      //eventListProvider.getFilterEventsFromFireStore();
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            CustomTextformField(
              hintText: AppLocalizations.of(context)!.event_serch,
              prefixicon: Icon(Icons.search),
              borderColor: AppColor.primeColordark,
            ),
            Expanded(
              child: eventListProvider.favoriteEventList.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_favorites,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          child: EventItemBody(
                            event: eventListProvider.favoriteEventList[index],
                          ),
                        );
                      },
                      itemCount: eventListProvider.favoriteEventList.length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
