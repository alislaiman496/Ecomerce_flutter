
import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:e_comerce_2/models/product_data_models.dart';
import 'package:e_comerce_2/widgets/cart_jewelery_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htt;

import '../screens/home_screen.dart';
import '../services/product_database_services.dart';
class JeweleryWidget extends StatefulWidget {
 late  String product;
   JeweleryWidget({Key? key,required this.product}) : super(key: key);

  @override
  State<JeweleryWidget> createState() => _JeweleryWidgetState();
}

class _JeweleryWidgetState extends State<JeweleryWidget> {
  DBUserManagerProduct dbUserManagerProduct =DBUserManagerProduct();
  ScrollController scrollController=ScrollController();
 late ProductData productData;
  var jwelery= '';
  Map json={};
  List  data=[];
  List respo=[];
  int index = 1;
  int id=0;
  late String s = '';
  bool done = false;
  Future<List> getQuetion() async {
    var question =
    await htt.get(Uri.tryParse('https://fakestoreapi.com/products/category/${widget.product}')!);
    print(question.statusCode);

    print(question.body.runtimeType);
    if (question.statusCode == 200) {
      jwelery = question.body ;

      respo=jsonDecode(jwelery);


      return respo;
    } else {
      throw Exception('Error');
    }
  }
 @override
 void dispose(){
   //...
   scrollController.dispose();
   super.dispose();
   //...
 }
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<List>(
      future: getQuetion(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if (snapshot.hasError) {
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:

              break;
            case ConnectionState.done:
              data = snapshot.data! ;
              print(data);
              done = true;
              productData=ProductData.fromMap(data[0]);
             id = data[0]['id'];

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
              ProductData pd=ProductData.fromMap(data[index]);
              dbUserManagerProduct.insertProductData(pd).then((value) => {

                // _firstNameController.clear(),
                // _lastNameController.clear(),
                // _emailController.clear(),
                // _phoneController.clear(),
                // _paswoordController.clear(),
                print("insertProductData Data Add to database $value"),
              });
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
      },
    );
  }
}


