
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/screens/login_screen.dart';
import 'package:e_comerce_2/screens/register_screen.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';

// import 'forgot_password_page.dart';
// import 'profile_page.dart';
// import 'registration_page.dart';
// import 'widgets/header_widget.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({Key? key}): super(key:key);
  static const String welcomeId='/welcomeId';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.account_circle_outlined), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                       AutoSizeText(

                       S.of(context).welcomeToTheE_CommerceApp.toUpperCase(),
                         textAlign: TextAlign.center,

                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height:10.0),
                       AutoSizeText(
                       S.of(context).signingOrRegisteringIntoAnAccount,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 50.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: AutoSizeText(S.of(context).signIn.toUpperCase(), style: ThemeHelper().textStyle(),),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushReplacementNamed(LogInScreen.logInId);
                                    //After successful login we will redirect to profile page. Let's create profile page noNavigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: AutoSizeText(S.of(context).signUp.toUpperCase(), style: ThemeHelper().textStyle(),),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushReplacementNamed(RegisterScreen.registerId);
                                    //After successful login we will redirect to profile page. Let's create profile page noNavigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                  },
                                ),
                              ),
                              SizedBox(height: 15.0),

                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}