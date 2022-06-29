import 'package:flutter/material.dart';

class UserProduct extends ChangeNotifier{

  late String email;
  late int productId;
  late int counter;


  UserProduct(

      {
        required this.email,
        required this.productId,
        required this.counter,
        });

  void setProductId(int value){
    productId=value;
    notifyListeners();
  }
  void setEmail(String value){
    email=value;
    notifyListeners();
  }
  void setCounter(int value){
    counter=value;
    notifyListeners();
  }

  Map<String, Object?> toMap() {
    return {

      'email': email,
      'productId': productId,
      'counter': counter,

    };
  }

  UserProduct.fromMap(Map<String, Object?> maps) {

    email = (maps['email'] as String);
    productId = (maps['productId'] as int);
    counter = (maps['counter'] as int);

  }
}