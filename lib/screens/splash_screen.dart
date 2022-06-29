import 'dart:async';

import 'package:e_comerce_2/models/shared_preference_models.dart';
import 'package:e_comerce_2/screens/home_screen.dart';
import 'package:e_comerce_2/screens/login_screen.dart';
import 'package:e_comerce_2/screens/pincode_verefecation_screen.dart';
import 'package:e_comerce_2/screens/product_screen.dart';
import 'package:e_comerce_2/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_register_class_models.dart';
import '../services/MyDBManager_PinCode_services.dart';
import '../services/MyDBManager_services.dart';



class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key, required this.title}) : super(key: key);
  static const String splashId='/splashId';
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<UserRigester>? lst;
  bool _isVisible = false;
  final DBUserManager dbUserManager = DBUserManager();
  final DBUserManagerPinCode dBUserManagerPinCode =DBUserManagerPinCode();
  _SplashScreenState(){
    Future preference() async{
      final  prefs = await  SharedPreferences.getInstance();
      Provider.of<SharedPreferenceModels>(context,listen: false).opened(true);
      await prefs.setBool('isOpened', true);
      await prefs.setBool('isRegister', false);
      await prefs.setBool('isLoggedIn', false);
    }



    Timer(
        const Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 2000), () async {

      lst=await dbUserManager.getUserList()  ;
      if(lst!=null){
        for(int i=0;i<lst!.length;i++) {
          if(lst![i].loggedin==1) {
            Provider.of<UserRigester>(context, listen: false)
                .setFirstName(lst![i].firstName);
            Provider.of<UserRigester>(context, listen: false)
                .setLastName(lst![i].lastName);
            Provider.of<UserRigester>(context, listen: false)
                .setEmailAdress(lst![i].emailAdress);
            Provider.of<UserRigester>(context, listen: false)
                .setMopbileNumber(lst![i].mobileNumber);
            Provider.of<UserRigester>(context, listen: false)
                .setPassword(lst![i].password);
            Navigator.of(context).pushReplacementNamed(ProductScreen.productId);
            break;
          }
          if(lst![i].statues==1&&lst![i].loggedin==0){
            Provider.of<UserRigester>(context, listen: false)
                .setFirstName(lst![i].firstName);
            Provider.of<UserRigester>(context, listen: false)
                .setLastName(lst![i].lastName);
            Provider.of<UserRigester>(context, listen: false)
                .setEmailAdress(lst![i].emailAdress);
            Provider.of<UserRigester>(context, listen: false)
                .setMopbileNumber(lst![i].mobileNumber);
            Provider.of<UserRigester>(context, listen: false)
                .setPassword(lst![i].password);
            Navigator.of(context).pushReplacementNamed(LogInScreen.logInId);
            break;

          }
          if(lst![i].statues==0&&lst![i].loggedin==0){
            Provider.of<UserRigester>(context, listen: false)
                .setFirstName(lst![i].firstName);
            Provider.of<UserRigester>(context, listen: false)
                .setLastName(lst![i].lastName);
            Provider.of<UserRigester>(context, listen: false)
                .setEmailAdress(lst![i].emailAdress);
            Provider.of<UserRigester>(context, listen: false)
                .setMopbileNumber(lst![i].mobileNumber);
            Provider.of<UserRigester>(context, listen: false)
                .setPassword(lst![i].password);
            Navigator.of(context).pushReplacementNamed(PinCodeScreen.pinCodeId);
            break;
          }

        }
      }
      else{
        Navigator.of(context).pushReplacementNamed(WelcomeScreen.welcomeId);
      }

      //!Provider.of<SharedPreferenceModels>(context,listen: false).isLoggedIn? Navigator.of(context).pushReplacementNamed(WelcomeScreen.welcomeId):Navigator.of(context).pushReplacementNamed(HomeScreen.homeId);

      final  prefs = await  SharedPreferences.getInstance();
      Provider.of<SharedPreferenceModels>(context,listen: false).opened(true);
      await prefs.setBool('isOpened', true);

      // if(prefs.getBool('isLoggedIn')!){
      //   String email=prefs.getString('emailLoggedIn')!;
      //   var  userLogged=await dbUserManager.getLogin(email);
      //
      //   Provider.of<UserRigester>(context, listen: false)
      //       .setFirstName(userLogged!.firstName);
      //   Provider.of<UserRigester>(context, listen: false)
      //       .setLastName(userLogged!.lastName);
      //   Provider.of<UserRigester>(context, listen: false)
      //       .setEmailAdress(userLogged!.emailAdress);
      //   Provider.of<UserRigester>(context, listen: false)
      //       .setMopbileNumber(userLogged!.mobileNumber);
      //   Provider.of<UserRigester>(context, listen: false)
      //       .setPassword(userLogged!.password);
      //   Navigator.of(context).pushReplacementNamed(HomeScreen.homeId);
      // }
    });
    return
      Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 2.0,
                        offset: const Offset(5.0, 3.0),
                        spreadRadius: 2.0,
                      )
                    ]
                ),
                child:  Center(
                  child: ClipOval(
                    child: Image.asset( "assets/images/ecommerce-icon.jpg"),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}