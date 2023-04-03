import 'package:flutter/material.dart';
import 'new_post_button.dart';

Map<String, dynamic> entryMap = {
  "entries" : [
    <String, dynamic> {
      "entry_id": "1234",
      "title": "Entry1",
      "contents": "that's rough buddy",
      "timestamp": 09149571,
    },
    <String, dynamic>{
      "entry_id": "1234",
      "title": "Entry2",
      "contents": "hello here's my post",
      "timestamp": 0914957,
    },
  ],
};

void main() {
  runApp(const EntryScreen());
}

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entry',
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for(int i = 0; i < ( entryMap['entries'] as List).length; i++)
                NewPostButton(
                    ((( entryMap['entries'] as List)[i] as Map<String, dynamic>)['entry_id'] as String),
                    ((( entryMap['entries'] as List)[i] as Map<String, dynamic>)['title'] as String),
                    ((( entryMap['entries'] as List)[i] as Map<String, dynamic>)['contents'] as String)
                ),
            ],
          ),
        ),
      ),
    );
  }
}