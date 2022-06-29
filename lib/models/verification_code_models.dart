import 'package:e_comerce_2/models/user_register_class_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerificationCode with ChangeNotifier {


  late  int vcCode;
  late   String genData;
  late  String endData;
  late  String email;
  late  int resendNumber;


  VerificationCode({required this.genData,required this.endData,required this.vcCode,required this.email,required this.resendNumber,});

  void setResendNumber(int value) {
    resendNumber = value;
    notifyListeners();
  }



  void setEmail(String value) {
    email = value;
    notifyListeners();
  }



  void setVcCode(int value) {
    vcCode = value;
    notifyListeners();
  }



  void setEndData(String value) {
    endData = value;
    notifyListeners();
  }



  void setGenData(String value) {
    genData = value;
    notifyListeners();
  }

  Map<String, Object?> toMap() {
    return {
      'gen_data': genData,
      'end_data': endData,
      'vc_code': vcCode,
      'email': email,
      'resendNumber': resendNumber,
    };
  }
  VerificationCode.fromMap( Map<String, Object?> maps){
    genData=(maps['gen_data'] as String?)!;
    endData=(maps['end_data'] as String?)!;
    vcCode=(maps['vc_code'] as int?)!;
    email=(maps['email'] as String?)!;
    resendNumber=(maps['resendNumber'] as int?)!;
  }

}
