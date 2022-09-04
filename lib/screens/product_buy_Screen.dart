
import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/list_product_model.dart';
import 'package:e_comerce_2/models/user_register_class_models.dart';
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
import '../models/product_data_models.dart';
import '../models/user_product_models.dart';
import '../services/MyDBManager_services.dart';
import '../services/entry_users_product_database_services.dart';
import '../services/product_database_services.dart';
import '../utils/theme_helper_utils.dart';
import '../widgets/cart_jewelery_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/jewelery_widget.dart';
import 'email_confermation_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class ProductBuyScreen extends StatefulWidget {
  const ProductBuyScreen({Key? key}) : super(key: key);
  static const String productBuyId = '/productBuyId';
  @override
  State<ProductBuyScreen> createState() => _ProductBuyScreenState();
}

class _ProductBuyScreenState extends State<ProductBuyScreen> {
  ScrollController scrollController=ScrollController();
  final DBUserManager dbUserManager = DBUserManager();
  final DBUserManagerProduct dbUserManagerProduct = DBUserManagerProduct();
  final formKey = GlobalKey<FormState>();
  final double _headerHeight = 250;
  bool valid=false;
  bool done = false;
  List  data=[];
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  var userList;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  final DBUserProduct dbUserProduct = DBUserProduct();
  Future <List>getRes() async {
    print(Provider.of<UserRigester>(context, listen: false).emailAdress);
    var res = await dbUserProduct
        .getOneUserProduct( Provider.of<UserRigester>(context, listen: false).emailAdress);
    var userProducts=[];
    for (int i=0;i<res.length;i++)
    {  userProducts.add(UserRigester.fromMap(res[i])) ;}
    //return userProducts;
    var prod=[];
    for (int i=0;i<userProducts.length;i++){
      var s=await dbUserManagerProduct.getOneProductData(userProducts[i].productId);
      prod.add(s);
    }
    print (prod[1].id);
    return prod;
  }
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
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
      body: FutureBuilder(
        future: getRes(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

          if (snapshot.hasError) {
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:

                break;
              case ConnectionState.done:
                done =true;
                print(data[0].id);
                data=snapshot.data!;


                break;
              case ConnectionState.none:
              // TODO: Handle this case.
                break;
              case ConnectionState.active:
              // TODO: Handle this case.
                break;
            }
          }
          if (done) {
            return ListView.builder(
              controller:scrollController ,
              itemCount: data.length,
              itemBuilder: (BuildContext context,int index){

                return CartJeweleryWidget(jeweleryData: ProductData.fromMap(data[index]));

              },

            );



          }
          else {
            return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [

                  CircularProgressIndicator(),
                ],
              ),

            );
          }
        }
      ),

    );

  }
}
