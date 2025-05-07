import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:flutter/foundation.dart';

class CurrentEventProvider extends ChangeNotifier {
  Event? currentEvent;
  void getCurrentEvent(Event event) {
    currentEvent = event;
    notifyListeners();
  }
}
