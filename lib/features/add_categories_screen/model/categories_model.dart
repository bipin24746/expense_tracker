import 'package:flutter/cupertino.dart';

class CategoriesModel {
  String name;
  String icon;
  bool isSelected;
  CategoriesModel({required this.name,required this.icon,this.isSelected = false});
}