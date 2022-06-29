import 'package:e_comerce_2/models/product_data_models.dart';
import 'package:flutter/cupertino.dart';

class ListProduct extends ChangeNotifier{
  late Set<ProductData> pd;

  ListProduct(this.pd);


}