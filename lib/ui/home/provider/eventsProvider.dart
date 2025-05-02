import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing_app/fireBaseUtils.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/toast_utils.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> listEvent = [];
  List<Event> filterList = [];
  List<String> eventsNameList = [];
  int slectedIndex = 0;

  List<Event> favoriteEventList = [];

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  void changeSlectedIndex(int index,String uId) {
    slectedIndex = index;
    slectedIndex == 0 ? getAllEvents(uId) : getFilterEventsFromFireStore(uId);
    notifyListeners();
  }
  //to get all events from the firebase

  void getAllEvents(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FireBaseUtils.getEvnetColoection(uId).get();
    listEvent = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = listEvent;
    // to sort of the event
    filterList.sort((Event event1, Event event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  void getFilterEventsFromFireStore(String uId) async {
    var querySnapshot = await FireBaseUtils.getEvnetColoection(uId)
        .where('eventName', isEqualTo: eventsNameList[slectedIndex])
        .orderBy('eventDate')
        .get();
    filterList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateIsFavoriteItem(Event event, BuildContext context,String uId) {
    FireBaseUtils.getEvnetColoection(uId)
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite}).timeout(
      Duration(milliseconds: 300),
      onTimeout: () {
        ToastUtils.toastMassage(
            backGroundColor: Colors.green,
            textColor: AppColor.whiteColor,
            massage: AppLocalizations.of(context)!.favorite_updated);
        slectedIndex == 0 ? getAllEvents(uId) : getFilterEventsFromFireStore(uId);
        geAllIsFavoriteEnevts(uId);
      },
    );
  }

  void geAllIsFavoriteEnevts(String uId) async {
    var querySnapshot = await FireBaseUtils.getEvnetColoection(uId)
        .where('isFavorite', isEqualTo: true)
        .orderBy('eventDate')
        .get();

    favoriteEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}
