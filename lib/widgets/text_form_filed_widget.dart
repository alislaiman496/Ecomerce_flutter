import 'package:flutter/material.dart';


import '../utils/theme_helper_utils.dart';

class TextFormFiledWidget extends StatelessWidget {
  var myValidator;
   Function mySaved;
   InputDecoration inpDecor;
   TextInputType myInputType;
   TextFormFiledWidget({Key? key,required this.myValidator,required this.mySaved, required this.inpDecor,required this.myInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
          decoration: inpDecor,
          keyboardType: myInputType,
          validator:  myValidator!(),
          onSaved:mySaved(),
      ),
    );
  }
}
