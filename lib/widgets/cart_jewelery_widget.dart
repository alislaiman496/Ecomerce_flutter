import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_comerce_2/models/list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xen_popup_card/xen_card.dart';

import '../models/product_data_models.dart';
import '../models/user_product_models.dart';
import '../models/user_register_class_models.dart';
import '../services/entry_users_product_database_services.dart';
import '../services/product_database_services.dart';


class CartJeweleryWidget extends StatefulWidget {
  late ProductData jeweleryData;
   CartJeweleryWidget({Key? key,required this.jeweleryData}) : super(key: key);

  @override
  State<CartJeweleryWidget> createState() => _CartJeweleryWidgetState();
}

class _CartJeweleryWidgetState extends State<CartJeweleryWidget> {
  // APP BAR
  //
  // [XenCardAppBar]


  // GUTTER
  //
  // [XenCardGutter]
  final DBUserProduct dbUserProduct = DBUserProduct();
  XenCardGutter gutter = const XenCardGutter(

    child: Padding(
      padding: EdgeInsets.symmetric(vertical:  8.0,horizontal: 32),
      child: AutoSizeText(""),
    ),
  );

late List<UserProduct> lst=[];
 final DBUserManagerProduct up=DBUserManagerProduct();
  @override
  Widget build(BuildContext context) {
    String email=Provider.of<UserRigester>(context,listen: false).emailAdress;
    int productId=widget.jeweleryData.id;
    int counter=5;
    XenCardAppBar appBar =  XenCardAppBar(
      shadow: const BoxShadow(color: Colors.transparent),

      child: AutoSizeText(
        widget.jeweleryData.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
    Widget cardWithGutterAndAppBar() => TextButton(
        onPressed: () => showDialog(
          context: context,
          builder: (builder) => XenPopupCard(
            appBar: appBar,
            gutter: gutter,
            body: ListView(
              children:  [
                SizedBox( width: 100, height:300,child: Image.network(widget.jeweleryData.image)),
                SizedBox(
                  height: 5,
                ),
                Text(widget.jeweleryData.description),
                SizedBox(
                  height: 5,
                ),
                AutoSizeText("Title : ${widget.jeweleryData.title.toUpperCase()}"),
                SizedBox(
                  height: 5,
                ),
                AutoSizeText("Price : ${widget.jeweleryData.price.toString()} \$")
              ],
            ),
          ),
        ),

        child:  Card(
          color: Colors.cyan,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  focusColor: Colors.lightBlue,
                  leading: CircleAvatar(
                    radius:20,
                    backgroundImage:    NetworkImage(widget.jeweleryData.image),
                  ),
                  title: AutoSizeText("Title : ${widget.jeweleryData.title.toUpperCase()}"),
                  subtitle: AutoSizeText("Price : ${widget.jeweleryData.price.toString()} \$",style:  TextStyle(backgroundColor: Colors.indigo,fontWeight: FontWeight.w900,fontSize: 15)),),
              ),
              ElevatedButton(onPressed: () async {

                UserProduct up =UserProduct(
                  email:  Provider.of<UserRigester>(context, listen: false).emailAdress,
                  productId:  widget.jeweleryData.id,
                );


                dbUserProduct.insertUserProduct(up).then((value) => {

                  print("Student Data Add to database $value"),
                });


              },style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(80, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ), child: AutoSizeText('Buy',),),
            ],
          ),
        )
    );


    return  cardWithGutterAndAppBar();
  }


}