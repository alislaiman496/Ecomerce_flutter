
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/user_register_class_models.dart';
import 'package:e_comerce_2/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce_2/screens/login_screen.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import '../services/MyDBManager_services.dart';
import '../widgets/header_widget.dart';
import '../generated/l10n.dart';

import '../screens/register_screen.dart';

class HomeScreen extends StatefulWidget{
  static const String homeId='/homeId';

  HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  final DBUserManager dbUserManager = DBUserManager();
  final double  _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: AutoSizeText(S.of(context).profilePage,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                    child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).colorScheme.secondary,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(S.of(context).ecommerce,
                    style: const TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: AutoSizeText(S.of(context).splashScreen, style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: S.of(context).splashScreen)));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary),
                title: AutoSizeText(S.of(context).loginPage, style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(LogInScreen.logInId);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary),
                title: AutoSizeText(S.of(context).registrationPage,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(RegisterScreen.registerId);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: AutoSizeText(S.of(context).forgetPasswordPage,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.of(context).pushNamed(UsersListScreen.usersListId);
                  //Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: AutoSizeText(S.of(context).verificationPage,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
               //   Navigator.push( context, MaterialPageRoute(builder: (context) => ForgotPasswordVerificationPage()), );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: AutoSizeText(S.of(context).logOutPage,style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: ()async {
                  var pass = await dbUserManager
                      .getLogin(Provider.of<UserRigester>(context, listen: false)
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
                  Navigator.of(context).pushReplacementNamed(LogInScreen.logInId);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                  ),
                  SizedBox(height: 20,),
                  AutoSizeText("${S.of(context).mr}${context.select((UserRigester p) => p.firstName)}" , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  AutoSizeText(S.of(context).engineering, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            S.of(context).userInformation,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: AutoSizeText(S.of(context).location),
                                          subtitle: AutoSizeText(S.of(context).syria),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: AutoSizeText(S.of(context).e_mailAddress),
                                          subtitle: Text('${context.select((UserRigester p) => p.emailAdress)}'),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: AutoSizeText(S.of(context).mobileNumber),
                                          subtitle: AutoSizeText('${context.select((UserRigester p) => p.mobileNumber)}'),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: AutoSizeText(S.of(context).aboutMe),
                                          subtitle: AutoSizeText(
                                              S.of(context).thisAccountIsLoggedIn),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}