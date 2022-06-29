import 'dart:math';

import 'package:e_comerce_2/models/shared_preference_models.dart';
import 'package:e_comerce_2/screens/pincode_verefecation_screen.dart';
import 'package:e_comerce_2/services/MyDBManager_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import '../models/user_register_class_models.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../generated/l10n.dart';
//import
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String registerId = '/registerId';
  var passwo;
  late UserRigester user = UserRigester(
    firstName: '',
    lastName: '',
    emailAdress: '',
    mobileNumber: '',
    password: '',
    loggedin: 0,
    statues: 0,
  );

  List<UserRigester> userList = [];
  final DBUserManager dbUserManager = DBUserManager();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _paswoordController = TextEditingController();
  int updateindex = 0;
  static String? email;
  static String? password;
  final formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  String? validateEmail(String value,context) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return S.of(context).emailIsRequired;
    } else {
      if (!isEmail) {
        return S.of(context).enterValidEmail;
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value,context) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowercase letter, 1 number, & 1 special character (symbol)
    /// Minimum character: 8
    bool isHardPassword = value.isPasswordHard();
    if (value.isEmpty) {
      return S.of(context).pleaseEnterPassword;
    } else {
      if (!isHardPassword) {
        return S.of(context).enterAHardPassword;
      } else {
        return null;
      }
    }
  }

  String? validatePhone(String value,context) {
    /// Phone Number regex
    /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
    /// Can add whitespace separating digit with "+" or "(+XX)"
    /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
    bool isPhone = value.isPhone();
    if (value.isEmpty) {
      return S.of(context).phoneNumberIsRequired;
    } else {
      if (!isPhone) {
        return S.of(context).enterValidPhoneNumber;
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double hi = MediaQuery.of(context).size.height;
    var s = user.password;
    void submitUser(BuildContext context) {
      if (formKey.currentState!.validate()) {
        {
          UserRigester us = UserRigester(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              emailAdress: _emailController.text,
              mobileNumber: _phoneController.text,
              password: _paswoordController.text,
              loggedin: 0,
              statues: 0,
          );

          Provider.of<UserRigester>(context, listen: false)
              .setFirstName(_firstNameController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setLastName(_lastNameController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setEmailAdress(_emailController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setMopbileNumber(_phoneController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setPassword(_paswoordController.text);
          dbUserManager.insertUser(us).then((value) => {

                // _firstNameController.clear(),
                // _lastNameController.clear(),
                // _emailController.clear(),
                // _phoneController.clear(),
                // _paswoordController.clear(),
                print("Student Data Add to database $value"),
              });

          user.setFirstName(_firstNameController.text);
          user.setLastName(_lastNameController.text);
          user.setEmailAdress(_emailController.text);
          user.setMopbileNumber(_phoneController.text);
          user.setPassword(_paswoordController.text);

          Provider.of<UserRigester>(context, listen: false)
              .setFirstName(_firstNameController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setLastName(_lastNameController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setEmailAdress(_emailController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setMopbileNumber(_phoneController.text);
          Provider.of<UserRigester>(context, listen: false)
              .setPassword(_paswoordController.text);

          // dbUserManager.updateUser(user).then((value) {
          //   userList[updateindex].setFirstName(_firstNameController.text);
          //   userList[updateindex].setLastName(_lastNameController.text);
          //   userList[updateindex].setEmailAdress(_emailController.text);
          //   userList[updateindex].setMopbileNumber(_phoneController.text);
          //   userList[updateindex].setPassword(_paswoordController.text);
          //
          //   //   _firstNameController.clear();
          //   // _lastNameController.clear();
          //   // _emailController.clear();
          //   // _phoneController.clear();
          //   // _paswoordController.clear();
          // });
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 0.25 * hi,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  0.02 * wi, 0.04 * hi, 0.02 * wi, 0.01 * hi),
              padding: EdgeInsets.fromLTRB(0.01 * wi, 0, 0.01 * wi, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: ThemeHelper().textInputDecoration(
                                S.of(context).firstName, S.of(context).enterYourFirstName),
                            validator: (val) => val!.isNotEmpty
                                ? null
                                : S.of(context).firstNameShouldNotBeEmpty,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            validator: (val) => val!.isNotEmpty
                                ? null
                                : S.of(context).lastNameShouldNotBeEmpty,
                            controller: _lastNameController,
                            decoration: ThemeHelper().textInputDecoration(
                                S.of(context).lastName,  S.of(context).enterYourLastName),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                              controller: _emailController,
                              decoration: ThemeHelper().textInputDecoration(
                                  S.of(context).e_mailAddress, S.of(context).enterYourEmail),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return validateEmail(value!,context);
                              },
                              onSaved: (value) {
                                email = value;
                              }),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: ThemeHelper().textInputDecoration(
                                S.of(context).mobileNumber, S.of(context).enterYourMobileNumber),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return validatePhone(value!,context);
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                S.of(context).password, S.of(context).enterYourPassword),
                            validator: (value) {
                              return validatePassword(value!,context);
                            },
                            controller: _paswoordController,
                            onSaved: (String? value) {
                              password = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                S.of(context).confirmPassword,  S.of(context).confirmYourPassword),
                            controller: _paswoordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return  S.of(context).pleaseRe_EnterTheSamePassword;
                              }
                              if(val!=_paswoordController.text){
                                return  S.of(context).pleaseRe_EnterTheSamePassword;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          checkboxValue = value!;
                                          state.didChange(value);
                                        }),
                                     AutoSizeText(
                                      S.of(context).iAcceptAllTermsAndConditions,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return  S.of(context).youNeedToAcceptTermsAndConditions;
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: AutoSizeText( S.of(context).register.toUpperCase(),
                                  style: ThemeHelper().textStyle()),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                var x = await dbUserManager
                                    .isLoggedIn(_emailController.text);
                                if (x) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.white,
                                          content: AutoSizeText(
                                           S.of(context).thisAccountIsLoggedIn,
                                            textAlign: TextAlign.center,
                                            style: ThemeHelper().textStyle(),
                                          )));
                                } else {
                                  formKey.currentState!.save();
                                  submitUser(context);

                                  formKey.currentState?.reset();
                                  Provider.of<SharedPreferenceModels>(context, listen: false)
                                      .newPassord(false);
                                  Navigator.of(context)
                                      .pushNamed(PinCodeScreen.pinCodeId);
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                         AutoSizeText(
                          S.of(context).orCreateAccountUsingSocialMedia,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus,
                                size: 35,
                                color: HexColor("#EC2D2F"),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alartDialog(
                                        "Google Plus",
                                        "You tap on GooglePlus social icon.",
                                        context);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  size: 23,
                                  color: HexColor("#FFFFFF"),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alartDialog(
                                        "Twitter",
                                        "You tap on Twitter social icon.",
                                        context);
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 35,
                                color: HexColor("#3E529C"),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ThemeHelper().alartDialog(
                                        "Facebook",
                                        "You tap on Facebook social icon.",
                                        context);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
