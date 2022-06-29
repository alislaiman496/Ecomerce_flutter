import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRigester with ChangeNotifier {
  late String emailAdress;
  late String firstName;
  late String lastName;
  late String mobileNumber;
  late String password;
  late int loggedin;
  late int statues;

  UserRigester(
      {required this.firstName,
      required this.lastName,
      required this.emailAdress,
      required this.mobileNumber,
      required this.password,
      required this.loggedin,
      required this.statues});

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setMopbileNumber(String value) {
    mobileNumber = value;
    notifyListeners();
  }

  void setLoggedIn(int value) {
    loggedin = value;
    notifyListeners();
  }
  void setStatues(int value) {
    statues = value;
    notifyListeners();
  }
  void setEmailAdress(String value) {
    emailAdress = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void setFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  Map<String, Object?> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': emailAdress,
      'mobile': mobileNumber,
      'password': password,
      'logged_in': loggedin,
      'statues': statues,
    };
  }

  UserRigester.fromMap(Map<String, Object?> maps) {
    firstName = (maps['first_name'] as String?)!;
    lastName = (maps['last_name'] as String?)!;
    emailAdress = (maps['email'] as String?)!;
    mobileNumber = (maps['mobile'] as String?)!;
    password = (maps['password'] as String?)!;
    loggedin = (maps['logged_in'] as int?)!;
    statues = (maps['statues'] as int?)!;
  }
}
