import 'package:flutter/cupertino.dart';

class CategoriesModel {
  int id;
  String name;
  String icon;
  bool isSelected;
  CategoriesModel({
    required this.id,
    required this.name,required this.icon,this.isSelected = false});
}