
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/user_register_class_models.dart';
import 'package:e_comerce_2/screens/product_buy_Screen.dart';
import 'package:e_comerce_2/screens/register_screen.dart';
import 'package:e_comerce_2/screens/splash_screen.dart';
import 'package:e_comerce_2/screens/users_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../services/MyDBManager_services.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/header_widget.dart';
import '../widgets/jewelery_widget.dart';
import 'email_confermation_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String productId = '/productId';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final DBUserManager dbUserManager = DBUserManager();
  final formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;
  bool valid=false;
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  var userList;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[

    JeweleryWidget( product:'jewelery',),

    JeweleryWidget( product:'electronics',),
    JeweleryWidget( product:'men\'s clothing',),
    JeweleryWidget( product:'women\'s clothing',),
  ];
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double high=MediaQuery.of(context).size.height;
         return Scaffold(
           appBar: AppBar(
             title: AutoSizeText(S.of(context).productPage,
               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
             ),
             elevation: 0.5,
             iconTheme: const IconThemeData(color: Colors.white),
             flexibleSpace:Container(
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomRight,
                       colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary,]
                   )
               ),
             ),
             actions: [
               Container(
                 margin: EdgeInsets.only( top: 16, right: 16,),
                 child: Stack(
                   children: <Widget>[
                     IconButton(onPressed: () async {
                       var x=await
                       Navigator.of(context).pushNamed(ProductBuyScreen.productBuyId);
                     }, icon:   Icon(Icons.shop),),
                     Positioned(
                       right: 0,
                       child: Container(
                         padding: const EdgeInsets.all(1),
                         decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                         constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                         child: AutoSizeText( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
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
                       child: ListTile(
                         leading: IconButton( icon:Icon(Icons.account_circle_outlined) ,onPressed: (){
                           Navigator.of(context).pushNamed(HomeScreen.homeId);
                         },),
                         title:  AutoSizeText(Provider.of<UserRigester>(context,listen: false).firstName,
                           style: const TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                         ),
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
      backgroundColor: Colors.white54,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
           bottomNavigationBar: Container(
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   blurRadius: 20,
                   color: Colors.black.withOpacity(.1),
                 )
               ],
             ),
             child: SafeArea(
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 0.015*high, vertical: 0.01*width),
                 child: GNav(
                   rippleColor: Colors.grey[300]!,
                   hoverColor: Colors.grey[100]!,
                   gap: 0.01*width,
                   activeColor: Colors.black,
                   iconSize: 0.05*width,
                   padding: EdgeInsets.symmetric(horizontal:0.02*width, vertical:0.01*width),
                   duration: Duration(milliseconds: 400),
                   tabBackgroundColor: Colors.grey[100]!,
                   color: Colors.black,
                   tabs: [

                     GButton(

                       icon: MdiIcons.diamondStone,
                       text: S.of(context).jewelery,
                       textSize: 0.01*width,

                     ),
                     GButton(
                       icon:MdiIcons.chip ,
                       text: S.of(context).electronics,
                       textSize: 0.01*width,
                     ),
                     GButton(
                       textSize: 0.01*width,
                       icon: MdiIcons.humanMale,
                       text: S.of(context).mensClothing,
                     ),
                     GButton(
                       icon: MdiIcons.humanFemale,
                       text: S.of(context).womensClothing,
                       textSize: 0.01*width,
                     ),
                   ],
                   selectedIndex: _selectedIndex,
                   onTabChange: (index) {
                     setState(() {
                       _selectedIndex = index;
                     });
                   },
                 ),
               ),
             ),
           ),
    );

  }
}
