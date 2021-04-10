import 'package:flutter/material.dart';



class ToDoComp extends StatelessWidget {

  final String title;
  final String description;
  final String date;



  const ToDoComp({Key key, this.title, this.description, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
               width: width,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                 title,
                 style: TextStyle(fontSize: 35,color: Colors.blue, fontWeight: FontWeight.bold),
                 
                 ),

                  Text(
                 description,
                 style: TextStyle(fontSize: 19,color: Colors.black, fontWeight: FontWeight.w300),
                 
                 ),

                  Text(
                 date,
                 style: TextStyle(fontSize: 19,color: Colors.black, fontWeight: FontWeight.w300),
                 
                 )

                 ],
               )
             );
  }
}