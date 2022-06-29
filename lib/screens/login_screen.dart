import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/shared_preference_models.dart';
import 'package:e_comerce_2/screens/email_confermation_screen.dart';
import 'package:e_comerce_2/screens/home_screen.dart';
import 'package:e_comerce_2/screens/product_screen.dart';
import 'package:e_comerce_2/screens/register_screen.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import '../generated/l10n.dart';

import '../models/user_register_class_models.dart';
import '../services/MyDBManager_services.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';
import 'package:global_snack_bar/global_snack_bar.dart';

// class LogInScreen extends StatefulWidget {
//   LogInScreen({Key? key}) : super(key: key);
//   static const String logInId = '/logInId';
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }
//
// class _LogInScreenState extends State<LogInScreen> {
//   @override
//   final _emailController = TextEditingController();
//   final _paswoordController = TextEditingController();
//   final DBUserManager dbUserManager = DBUserManager();
//   final formKey = GlobalKey<FormState>();
//   final double _headerHeight = 250;
//   bool valid=false;
//   var userList;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   String? validateEmail(String value) {
//     bool isEmail = value.isEmail();
//     if (value.isEmpty) {
//       return 'Email is required';
//     } else {
//       if (!isEmail) {
//         return 'Enter valid Email';
//       } else if (valid) {
//         return 'Wrong Email please Enter a valid Email';
//       } else {
//         return null;
//       }
//     }
//   }
//
//
//   String? validatePassword(String value) {
//     /// Password (Hard) Regex
//     /// Allowing all character except 'whitespace'
//     /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
//     /// Minimum character: 8
//     bool isHardPassword = value.isPasswordHard();
//     if (value.isEmpty) {
//       return 'Please enter password';
//     } else {
//       if (!isHardPassword)
//         return 'Enter a hard password';
//       else
//         return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<SharedPreferenceModels>(context, listen: false).acces = false;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: _headerHeight,
//               child: HeaderWidget(_headerHeight, true,
//                   Icons.login_rounded), //let's create a common header widget
//             ),
//             SafeArea(
//               child: Container(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                   margin: const EdgeInsets.fromLTRB(
//                       20, 10, 20, 10), // This will be the login form
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Hello',
//                         style: TextStyle(
//                             fontSize: 60, fontWeight: FontWeight.bold),
//                       ),
//                       const Text(
//                         'Signing into your account',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       const SizedBox(height: 30.0),
//                       Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               Container(
//                                 decoration:
//                                     ThemeHelper().inputBoxDecorationShaddow(),
//                                 child: TextFormField(
//                                     controller: _emailController,
//                                     decoration: ThemeHelper()
//                                         .textInputDecoration("E-mail address",
//                                             "Enter your email"),
//                                     keyboardType: TextInputType.emailAddress,
//                                     validator: (value) {
//                                       return validateEmail(value!);
//                                     },
//                                     onSaved: (value) {
//                                       UserRigester p = UserRigester(
//                                         firstName: 'Ali',
//                                         lastName: 'Slaiman',
//                                         emailAdress: 'ali.slaiman496@gmail.com',
//                                         mobileNumber: '0935582047',
//                                         password: 'ali.slaiman.496',
//                                       );
//                                     }),
//                               ),
//                               const SizedBox(height: 30.0),
//                               Container(
//                                 decoration:
//                                     ThemeHelper().inputBoxDecorationShaddow(),
//                                 child: TextFormField(
//                                   obscureText: true,
//                                   decoration: ThemeHelper().textInputDecoration(
//                                       "Password*", "Enter your password"),
//                                   validator: (value) {
//                                     return validatePassword(value!);
//                                   },
//                                   onSaved: (String? value) {},
//                                   controller: _paswoordController,
//                                 ),
//                               ),
//                               SizedBox(height: 15.0),
//                               Container(
//                                 margin:
//                                     const EdgeInsets.fromLTRB(10, 0, 10, 20),
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).pushReplacementNamed(
//                                         EmailConfirmationScreen
//                                             .emailConfirmationId);
//                                   },
//                                   child: const Text(
//                                     "Forget your password?",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration:
//                                     ThemeHelper().buttonBoxDecoration(context),
//                                 child: ElevatedButton(
//                                   style: ThemeHelper().buttonStyle(),
//                                   child: Padding(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         40, 10, 40, 10),
//                                     child: Text(
//                                       'Sign In'.toUpperCase(),
//                                       style: ThemeHelper().textStyle(),
//                                     ),
//                                   ),
//                                   onPressed: () async {
//                                     formKey.currentState?.validate();
//                                     if (formKey.currentState!.validate()) {
//                                       formKey.currentState!.save();
//                                       var x = await dbUserManager
//                                           .isLoggedIn(_emailController.text);
//                                       var pass = await dbUserManager
//                                           .getLogin(_emailController.text);
//                                       print(pass);
//                                       var pass1 = pass?.password;
//                                       print(pass1);
//                                       setState(() {  valid=!x;
//
//
//                                       });
//                                       if (x &&
//                                           pass1 == _paswoordController.text) {
//                                         Navigator.of(context)
//                                             .pushReplacementNamed(
//                                                 HomeScreen.homeId);
//                                       } else if (!x) {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(SnackBar(
//                                                 content: AutoSizeText(
//                                           '''Wrong Email You are not Logged in''',
//                                           textAlign: TextAlign.center,
//                                           style: ThemeHelper().textStyle(),
//                                         )));
//                                       } else {
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(SnackBar(
//                                                 content: AutoSizeText(
//                                           'Wrong Password',
//                                           textAlign: TextAlign.center,
//                                           style: ThemeHelper().textStyle(),
//                                         )));
//                                       }
//                                     }
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                 margin:
//                                     const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                                 child: Text.rich(TextSpan(children: [
//                                   const TextSpan(
//                                       text: "Don\'t have an account? "),
//                                   TextSpan(
//                                     text: 'Create',
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.of(context)
//                                             .pushReplacementNamed(
//                                                 RegisterScreen.registerId);
//                                       },
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .secondary),
//                                   ),
//                                 ])),
//                               ),
//                             ],
//                           )),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  static const String logInId = '/logInId';
  @override
  final _emailController = TextEditingController();
  final _paswoordController = TextEditingController();
  final DBUserManager dbUserManager = DBUserManager();
  final formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;
  bool valid = false;
  var userList;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? validateEmail(String value,context) {
    bool isEmail = value.isEmail();
    if (value.isEmpty) {
      return S.of(context).emailIsRequired;
    } else {
      if (!isEmail) {
        return S.of(context).enterValidEmail;
      } else if (valid) {
        return S.of(context).wrongEmailPleaseEnterAValidEmail;
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value,context) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
    /// Minimum character: 8
    bool isHardPassword = value.isPasswordHard();
    if (value.isEmpty) {
      return S.of(context).pleaseEnterPassword;
    } else {
      if (!isHardPassword)
        return S.of(context).enterAHardPassword;
      else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SharedPreferenceModels>(context, listen: false).acces = false;
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
                        S.of(context).signingIntoYourAccount,
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
                                        .textInputDecoration( S.of(context).e_mailAddress,
                                        S.of(context).enterYourEmail),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return validateEmail(value!,context);
                                    },
                                    onSaved: (value) {
                                      UserRigester p = UserRigester(
                                        firstName: 'Ali',
                                        lastName: 'Slaiman',
                                        emailAdress: 'ali.slaiman496@gmail.com',
                                        mobileNumber: '0935582047',
                                        password: 'ali.slaiman.496',
                                        loggedin: 0,
                                        statues: 0,
                                      );
                                    }),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      S.of(context).password, S.of(context).enterYourPassword),
                                  validator: (value) {
                                    return validatePassword(value!,context);
                                  },
                                  onSaved: (String? value) {},
                                  controller: _paswoordController,
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        EmailConfirmationScreen
                                            .emailConfirmationId);
                                  },
                                  child:  AutoSizeText(
                                    S.of(context).forgetYourPassword,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: AutoSizeText(
                                      S.of(context).signIn.toUpperCase(),
                                      style: ThemeHelper().textStyle(),
                                    ),
                                  ),
                                  onPressed: () async {
                                    formKey.currentState?.validate();
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      var x = await dbUserManager
                                          .isLoggedIn(_emailController.text);
                                      var pass = await dbUserManager
                                          .getLogin(_emailController.text);
                                      print(pass);
                                      var pass1 = pass?.password;
                                      print(pass1);

                                      if (x &&
                                          pass1 == _paswoordController.text) {
                                        var user = UserRigester(
                                            firstName: pass!.firstName,
                                            lastName: pass!.lastName,
                                            emailAdress: pass!.emailAdress,
                                            mobileNumber: pass!.mobileNumber,
                                            password: pass!.password,
                                            loggedin: 1,
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
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                ProductScreen.productId);
                                      } else if (!x) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.white,
                                                content: AutoSizeText(
                                                 S.of(context).wrongEmailYouAreNotLoggedIn,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      ThemeHelper().textStyle(),
                                                )));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: Colors.white,
                                                content: AutoSizeText(
                                                  S.of(context).wrongPassword,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      ThemeHelper().textStyle(),
                                                )));
                                      }
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text.rich(TextSpan(children: [
                                   TextSpan(
                                      text: S.of(context).dontHaveAnAccount),
                                  TextSpan(
                                    text: S.of(context).create,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                RegisterScreen.registerId);
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ])),
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
