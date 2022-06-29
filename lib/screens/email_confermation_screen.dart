import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/screens/home_screen.dart';
import 'package:e_comerce_2/screens/pincode_verefecation_screen.dart';


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import '../generated/l10n.dart';
import '../models/shared_preference_models.dart';
import '../models/user_register_class_models.dart';
import '../services/MyDBManager_services.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';


class EmailConfirmationScreen extends StatelessWidget {
  EmailConfirmationScreen({Key? key}) : super(key: key);
  static const String emailConfirmationId = '/emailConfirmationId';
  @override
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final double _headerHeight = 250;
  final DBUserManager dbUserManager = DBUserManager();
  static String? email;
  static String? password;
  String? validateEmail(String value) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return 'Email is required';
    } else {
      if (!isEmail) {
        return 'Enter valid Email';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
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
                       S.of(context).verificationYourEmailAddress,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(

                                  controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(S.of(context).e_mailAddress,
                                       S.of(context).enterYourEmail),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return validateEmail(value!);
                                    },
                                    onSaved: (value) {
                                      email = value;

                                    }),
                              ),
                              const SizedBox(height: 30.0),

                              Container(
                                decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                     S.of(context).confirm.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {

                                    formKey.currentState?.validate();
                                    if (formKey.currentState!.validate()) {
                                      var pass = await dbUserManager
                                          .getLogin(_emailController.text);
                                      var user = UserRigester(
                                          firstName: pass!.firstName,
                                          lastName: pass!.lastName,
                                          emailAdress: pass!.emailAdress,
                                          mobileNumber: pass!.mobileNumber,
                                          password: pass!.password,
                                          loggedin: 0,
                                          statues: 1);
                                      dbUserManager.updateUser(user);
                                      Provider.of<UserRigester>(context, listen: false)
                                          .setFirstName( pass!.firstName);
                                      Provider.of<UserRigester>(context, listen: false)
                                          .setLastName(pass!.lastName);
                                      Provider.of<UserRigester>(context, listen: false)
                                          .setEmailAdress( pass!.emailAdress);
                                      Provider.of<UserRigester>(context, listen: false)
                                          .setMopbileNumber( pass!.mobileNumber);
                                      Provider.of<UserRigester>(context, listen: false)
                                          .setPassword(pass!.password);
                                      Provider.of<SharedPreferenceModels>(context,listen: false).newPassord(true);
                                      formKey.currentState!.save();
                                      Navigator.of(context)
                                          .pushNamed(
                                          PinCodeScreen.pinCodeId);
                                    }
                                  },
                                ),
                              ),

                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
