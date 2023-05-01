import 'package:flutter/material.dart';
import 'entry.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<Entry> entries = [];
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Page'),
      ),
    );
  }
}