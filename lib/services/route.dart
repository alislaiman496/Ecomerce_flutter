
import 'package:e_comerce_2/screens/email_confermation_screen.dart';
import 'package:e_comerce_2/screens/product_buy_Screen.dart';

import 'package:e_comerce_2/screens/product_screen.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/newpassword_screen.dart';
import '../screens/pincode_verefecation_screen.dart';
import '../screens/register_screen.dart';
import '../screens/users_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_screen.dart';
class RouteGenerator {
  static const String register=RegisterScreen.registerId;
  static const String logIn=LogInScreen.logInId;
  static const String emailConfermation=EmailConfirmationScreen.emailConfirmationId;
  static const String home=HomeScreen.homeId;
  static const String newPassword=NewPasswordScreen.newPasswordId;
   static const String pinCodeVerevication=PinCodeScreen.pinCodeId;
  static const String splash=SplashScreen.splashId;
  static const String welcome=WelcomeScreen.welcomeId;
 static const String usersListScreen=UsersListScreen.usersListId;
  static const String productScreen=ProductScreen.productId;
  static const String productBuy=ProductBuyScreen.productBuyId;
  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productBuy:

        return MaterialPageRoute(

          builder: (_) =>   ProductBuyScreen( ),

        );
      case register:

        return MaterialPageRoute(

          builder: (_) =>   RegisterScreen( ),

        );
      case productScreen:

        return MaterialPageRoute(

          builder: (_) =>   ProductScreen( ),

        );
      case logIn:

        return MaterialPageRoute(

          builder: (_) =>   LogInScreen(),

        );
   case emailConfermation:

        return MaterialPageRoute(

          builder: (_) =>  EmailConfirmationScreen(),

        );
      case home:

        return MaterialPageRoute(

          builder: (_) =>  HomeScreen(),

        );
      case newPassword:

        return MaterialPageRoute(

          builder: (_) =>  NewPasswordScreen(),

        );
      case pinCodeVerevication:

        return MaterialPageRoute(

          builder: (_) =>  PinCodeScreen(),

        );
      case splash:

        return MaterialPageRoute(

          builder: (_) =>   SplashScreen(title: 'Flutter Login UI'),

        );
      case welcome:

        return MaterialPageRoute(

          builder: (_) =>  const WelcomeScreen(),

        );


      case usersListScreen:

        return MaterialPageRoute(

          builder: (_) =>   UsersListScreen(),

        );


      default:
        throw const FormatException("Route not found");

    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
