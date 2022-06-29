import 'package:e_comerce_2/models/list_product_model.dart';
import 'package:e_comerce_2/models/verification_code_models.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';
import 'package:e_comerce_2/services/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'models/shared_preference_models.dart';
import 'models/user_product_models.dart';
import 'models/user_register_class_models.dart';
import 'generated/l10n.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserRigester>(
          create: (_) => UserRigester(
                firstName: 'Ali',
                lastName: 'Slaiman',
                emailAdress: 'ali.slaiman496@gmail.com',
                mobileNumber: '0935582047',
                password: 'ali.slaiman.496',
               loggedin: 0,
                statues: 0,
              )),
      FutureProvider<SharedPreferenceModels>(
          create: (_) async {

            return SharedPreferenceModels(
                isOpened: false,
                isRegister: false,
                isLoggedIn: false,
                newPass: false,
                acces: false,
                active: false,
              emailNotLoggedInButActive: '',
              emailNotLoggedInNotActive: "",
              emailLoggedIn: "",
            );
          },
          initialData: SharedPreferenceModels(
              isOpened: false,
              isRegister: false,
              isLoggedIn: false,
              newPass: false,
              acces: false,
            active: false,
            emailNotLoggedInButActive: '',
            emailNotLoggedInNotActive: "",
            emailLoggedIn: "",

          )),
      ChangeNotifierProvider<VerificationCode>(
          create: (_) => VerificationCode(
              email: '',
              genData: DateTime.now().toString(),
              endData: DateTime.now().toString(),
              vcCode: 0,
              resendNumber: 0)),
      ChangeNotifierProvider<UserProduct>(
          create: (_) => UserProduct(
              email: '',
            productId: 0,
            counter: 0,
              )),
      ChangeNotifierProvider<ListProduct>(
          create: (_) => ListProduct(
              {})),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color primaryColor = HexColor('#DC54FE');
    Color accentColor = HexColor('#8A02AE');
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: RouteGenerator.generateRoute,
      home:
      //ProductScreen(),
          //LoginPage(),
         SplashScreen(title: "Ecommerce"),
      // title: S.of(context).materialAppTitle,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: accentColor),
      ),

    );
  }
}
