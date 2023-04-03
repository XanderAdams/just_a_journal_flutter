import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
 const NewPostButton(
     this.entryID,
     this.title,
     this.contents,
     {Key? key}
     ) : super(key: key);
 final String entryID;
 final String title;
 final String contents;

 @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       const Padding(padding: EdgeInsets.all(5)),
       SizedBox(
         height: 60,
         width: double.infinity,
         child: ElevatedButton(
           onPressed: () {},
           child: Column(
             children: [
               Align(
                 alignment: Alignment.topLeft,
                 child: Text(title),
               ),
               const Padding(padding: EdgeInsets.all(10)),
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Text(contents),
               ),
             ],
           ),
         ),
       ),
     ],
   );
 }
}