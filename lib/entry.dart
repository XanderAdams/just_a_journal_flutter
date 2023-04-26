import 'package:flutter/material.dart';
import 'tags.dart';

class Entry {
  String title;
  String contents;
  Color color;
  List<Tag> tags;

  Entry(this.title, this.contents, this.color, this.tags);
}