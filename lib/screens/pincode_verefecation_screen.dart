import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/shared_preference_models.dart';
import 'package:e_comerce_2/models/verification_code_models.dart';
import 'package:e_comerce_2/screens/login_screen.dart';
import 'package:e_comerce_2/screens/newpassword_screen.dart';

import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../models/user_register_class_models.dart';
import '../services/MyDBManager_PinCode_services.dart';
import '../services/MyDBManager_services.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);
  static const String pinCodeId = '/pinCodeId';
  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final formKey = GlobalKey<FormState>();
  final DBUserManagerPinCode dBUserManagerPinCode = DBUserManagerPinCode();
  final double _headerHeight = 250;
  final DBUserManager dbUserManager = DBUserManager();
  static String? email;
  static String? password;
  int timer = 0;
  int vcCode = Random().nextInt(900000) + 100000;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    Column buildTimer() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           AutoSizeText(S.of(context).thisCodeWillBeExpiredIn),
          TweenAnimationBuilder(
              tween: Tween(begin: 30.0, end: 0.0),
              duration: const Duration(seconds: 30),
              builder: (_, dynamic value, child) {
                timer = value.toInt();


                return AutoSizeText(
                  "00:${value.toInt()}",
                  style: const TextStyle(color: Colors.black38),
                );
              }),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.pin_invoke), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                       AutoSizeText(
                        S.of(context).hello,
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        '${S.of(context).weSentYourCodeTo} ${Provider.of<UserRigester>(context).emailAdress} ***',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      buildTimer(),
                      AutoSizeText(
                        '${S.of(context).pleaseEnterThePinCode} $vcCode ***',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Visibility(
                              child: Pinput(
                                closeKeyboardWhenCompleted: true,
                                length: 6,
                                keyboardType: TextInputType.phone,
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                submittedPinTheme: submittedPinTheme,
                                // Without Validator
                                // If true error state will be applied no matter what validator returns
                                forceErrorState: true,
                                // Text will be displayed under the Pinput
                                errorText: '',

                                /// ------------
                                /// With Validator
                                /// Auto validate after user tap on keyboard done button, or completes Pinput
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                validator: (pin) {
                                  if (pin ==
                                      vcCode
                                          .toString()) {
                                    return null;
                                  } else {
                                    return S.of(context).pinIsIncorrect;
                                  }
                                },
                              ),
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: AutoSizeText(
                                    S.of(context).confirm.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () async {
                                  formKey.currentState?.validate();
                                  if (timer != 0) {

                                    if (formKey.currentState!.validate()) {
                                      print(timer);
                                      var pass = await dbUserManager.getLogin(
                                          Provider.of<UserRigester>(context,
                                                  listen: false)
                                              .emailAdress);
                                      var user = UserRigester(
                                          firstName: pass!.firstName,
                                          lastName: pass!.lastName,
                                          emailAdress: pass!.emailAdress,
                                          mobileNumber: pass!.mobileNumber,
                                          password: pass!.password,
                                          loggedin: 0,
                                          statues: 1);
                                      dbUserManager.updateUser(user);
                                      VerificationCode vc = VerificationCode(
                                        resendNumber: 0,
                                        vcCode: vcCode,
                                        endData: DateTime.now()
                                            .add(const Duration(seconds: 30))
                                            .toString(),
                                        genData: DateTime.now().toString(),
                                        email: pass!.emailAdress,
                                      );
                                      var vcCodeRandom = vc.vcCode;
                                      Provider.of<VerificationCode>(context,
                                              listen: false)
                                          .setVcCode(vcCodeRandom);
                                      Provider.of<VerificationCode>(context,
                                              listen: false)
                                          .setEmail(vc.email);
                                      Provider.of<VerificationCode>(context,
                                              listen: false)
                                          .setEndData(vc.endData);
                                      Provider.of<VerificationCode>(context,
                                              listen: false)
                                          .setGenData(vc.genData);
                                      Provider.of<VerificationCode>(context,
                                              listen: false)
                                          .setResendNumber(vc.resendNumber);
                                      context
                                          .read<SharedPreferenceModels>()
                                          .newPass
                                          ? dBUserManagerPinCode
                                          .updatePinCode(vc)
                                          .then((value) {})
                                          : dBUserManagerPinCode
                                          .insertVerificationCode(vc)
                                          .then((value) {});
                                      dBUserManagerPinCode
                                          .insertVerificationCode(vc)
                                          .then((value) {});
                                      print(context
                                          .read<SharedPreferenceModels>()
                                          .newPass);
                                      context
                                              .read<SharedPreferenceModels>()
                                              .newPass
                                          ? Navigator.of(context)
                                              .pushReplacementNamed(
                                                  NewPasswordScreen
                                                      .newPasswordId)
                                          : Navigator.of(context)
                                              .pushReplacementNamed(
                                                  LogInScreen.logInId);
                                    }
                                  } else {
                                    CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.error,
                                        title: S.of(context).oops,
                                        text:
                                            S.of(context).sorryThePinCodeExpired,
                                        loopAnimation: false,
                                        onConfirmBtnTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  PinCodeScreen.pinCodeId);
                                        });
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      PinCodeScreen.pinCodeId);
                                },
                                child:  AutoSizeText(
                                 S.of(context).resendPinCode,
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}


