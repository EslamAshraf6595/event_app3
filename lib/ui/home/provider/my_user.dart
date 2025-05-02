import 'package:event_planing_app/model/my_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  MyUser? currentUser;

  void updateUserName(MyUser newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
