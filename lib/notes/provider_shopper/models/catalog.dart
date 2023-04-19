import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'sprint',
    'scope',
    'one-hour',
    'templates',
    'lamda',
    'pointer'
  ]; // 6
/*
  String getByPosition(int position) {
    return itemNames[position];
  }

  String getByIndex(int index) => itemNames[index];


  Item getByIndex(int index) => Item(index, itemNames[index]);
}

@immutable // class cannot be changed once it is made
class Item {
  final int id;
  final String name;
  final Color color;
  final int price;

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;    */
}
