import 'package:flutter/material.dart';

class NewPostButton extends StatelessWidget {
 const NewPostButton(
     this.postID,
     this.title,
     this.postContents,
     {Key? key}
     ) : super(key: key);
 final String postID;
 final String title;
 final String postContents;

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
                 alignment: Alignment.bottomRight,
                 child: Text(title),
               ),
               const Padding(padding: EdgeInsets.all(10)),
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Text(postContents),
               ),
             ],
           ),
         ),
       ),
     ],
   );
 }
}