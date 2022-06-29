
import 'package:e_comerce_2/screens/home_screen.dart';
import 'package:e_comerce_2/screens/login_screen.dart';
import 'package:e_comerce_2/services/MyDBManager_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../models/shared_preference_models.dart';
import '../models/user_register_class_models.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:auto_size_text/auto_size_text.dart';

//import 'profile_page.dart';
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  static const String newPasswordId='/newPasswordId';
  var passwo;
  late UserRigester user=UserRigester( firstName: 'Ali',
    lastName:      'Slaiman',
    emailAdress:     'ali.slaiman496@gmail.com',
    mobileNumber:      '0935582047',
    password:      'ali.slaiman.496',
    loggedin: 0,
    statues: 0,);
  final formKey = GlobalKey<FormState>();

  final double _headerHeight = 250;
  List<UserRigester> userList=[];
  final DBUserManager dbUserManager =  DBUserManager();
  final _paswoordController = TextEditingController();

  static  String? password;



  String? validatePassword(String value,context) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
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

  @override
  Widget build(BuildContext context) {
    double wi=MediaQuery.of(context).size.width;
    double hi=MediaQuery.of(context).size.height;

    void submitUser(BuildContext context) {
      if (formKey.currentState!.validate()) {
        dbUserManager.updateUser(user).then((value) {
          Provider.of<UserRigester>(context,listen: false).password = _paswoordController.text;
          _paswoordController.clear();

        });
        // }
      }
    }
    return  Scaffold(
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
                       Text(
                       S.of(context).hello,
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                       AutoSizeText(
                       S.of(context).insertNewPassword,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(

                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                     S.of(context).newPassword, S.of(context).enterYourNewPassword),
                                  validator: (value) {
                                    return validatePassword(value!,context);
                                  },
                                  controller:_paswoordController,
                                  onSaved: (String? value){
                                    password=value;

                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                     S.of(context).confirmPassword, S.of(context).confirmYourPassword),
                                  controller: _paswoordController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return S.of(context).pleaseRe_EnterYourPassword;
                                    }
                                    if(val!=_paswoordController.text){
                                      return S.of(context).pleaseRe_EnterTheSamePassword;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: AutoSizeText(
                                     S.of(context).confirm.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {

                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      submitUser(context);
                                      formKey.currentState?.reset();
                                      var pass = await dbUserManager
                                          .getLogin(Provider.of<UserRigester>(context, listen: false)
                                          .emailAdress);
                                      var user = UserRigester(
                                          firstName: pass!.firstName,
                                          lastName: pass!.lastName,
                                          emailAdress: pass!.emailAdress,
                                          mobileNumber: _paswoordController.text,
                                          password: pass!.password,
                                          loggedin: 0,
                                          statues: 1);
                                      dbUserManager.updateUser(user);
// ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: AutoSizeText('Processing Data')));
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => LogInScreen()
                                          ),
                                              (Route<dynamic> route) => false
                                      );
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
