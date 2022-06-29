import 'dart:core';

import 'package:flutter/material.dart';

class SharedPreferenceModels extends ChangeNotifier {
  late bool isRegister;
  late bool isLoggedIn;
  late bool active;

  late bool isOpened;
  late bool newPass;
  int pinCode = 111111;
  late bool acces;
  late String emailLoggedIn;
  late String emailNotLoggedInButActive;
  late String emailNotLoggedInNotActive;
  SharedPreferenceModels(
      {required this.isRegister,
      required this.isLoggedIn,
      required this.isOpened,
      required this.newPass,
      required this.acces,
      required this.emailLoggedIn,
      required this.emailNotLoggedInButActive,
        required this.emailNotLoggedInNotActive,
        required this.active,

      });
  void registered(bool registerd) {
    isRegister = registerd;
    notifyListeners();
  }

  void loggedIn(bool loggedin) {
    isLoggedIn = loggedin;
    notifyListeners();
  }

  void opened(bool oppened) {
    isOpened = oppened;
    notifyListeners();
  }

  void newPassord(bool newpa) {
    newPass = newpa;
    notifyListeners();
  }

  void setacces(bool value) {
    acces = value;
  }
  void setActive(bool value) {
    active = value;
  }
  void setEmailLoggedIn(String value) {
    emailLoggedIn = value;
  }
  void setEmailNotLoggedInButActive(String value) {
    emailNotLoggedInButActive = value;
  }
  void setEmailNotLoggedInNotActive(String value) {
    emailNotLoggedInNotActive = value;
  }


}
