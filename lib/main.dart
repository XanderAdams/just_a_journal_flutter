import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class Entry {
  String title;
  String contents;
  Color color;
  String tags;

  Entry(this.title, this.contents, this.color, this.tags);
}

List<Entry> entries = [];

void main() {
  entries.add(Entry("here's my title", "heres my theoretically longer string", Colors.blueAccent, 'tag,tag,tag,cool'));
  entries.add(Entry("here's my other title", "heres my kind of longer string", Colors.yellowAccent, 'tag,tag,cool'));
  entries.add(Entry("here's my third title", "heres my theoretically super duper extra long string wordswordswordsword swordsword swordswordswords wordswordsword swords", Colors.redAccent, 'tag,tag,tag,cool'));

  print("Entry: " + entries.length.toString());

  runApp(
      MaterialApp(
        title: '',
        initialRoute: '/',
        routes: {
          '/': (context) => const JournalPage(),
          '/new_entry': (context) => const NewEntry(),
        },
      )
  );
}

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}



class _JournalPageState extends State<JournalPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              for(int i = 0; i < entries.length; i++)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                      decoration: BoxDecoration(
                        color: entries[i].color,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: 300,
                      child: Column(
                        children: [
                          Text(entries[i].title),
                          Padding(padding: EdgeInsets.all(3)),
                          Text(entries[i].contents),
                          Text(entries[i].tags),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10))
                  ],
                )




              // siezebox default size
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new_entry');
            //entries.add(Entry(title, contents, color, tags));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add)
      ),
    );
  }
}

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<NewEntry> createState() => _NewEntryState();
}



class _NewEntryState extends State<NewEntry> {
  late TextEditingController titleText;
  late TextEditingController contentsText;
  late TextEditingController tagText;
  Color currentColor = Colors.deepPurpleAccent;

  @override
  void initState() {
    super.initState();
    titleText = TextEditingController(text: '');
    contentsText = TextEditingController(text: '');
    tagText = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 300, //double.infinity
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: titleText,
                    onChanged:(String? value) {
                      if (value != null) {
                        /*setState(() {
                        updateOutput();
                      });*/
                      }
                    }
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 300, //double.infinity
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: contentsText,
                    onChanged:(String? value) {
                      if (value != null) {
                        /*setState(() {
                        updateOutput();
                      });*/
                      }
                    }
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 300, //double.infinity
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: tagText,
                    onChanged:(String? value) {
                      if (value != null) {
                        /*setState(() {
                        updateOutput();
                      });*/
                      }
                    }
                ),
              ),
              const Padding(padding: EdgeInsets.all(30)),
              Container(
                width: 300,
                height: 300,
                child: Expanded(
                  child: BlockPicker(
                    pickerColor: currentColor,
                      onColorChanged: (color){
                      setState(() {
                        currentColor = color;
                      });
                      },
                  ),
                ),
              )
            ],

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            if (titleText.text == '') {return;}
            if (contentsText.text == '') {return;}
            if (tagText.text == '') {return;}
            entries.add(Entry(titleText.text, contentsText.text, currentColor, tagText.text));

            Navigator.push(context, new MaterialPageRoute(builder: (context) => new JournalPage()));
          }),
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add)
      ),
    );
  }
}

class Tag {
  String name;

  Tag(this.name);
}