import 'package:flutter/material.dart';
import 'package:tuto/comp/Todo.dart';
import 'package:tuto/pages/Converter.dart';
import 'package:tuto/pages/FeedsPage.dart';
import 'package:tuto/pages/Gallery.dart';
import 'package:tuto/pages/SignInPage.dart';
import 'package:tuto/pages/TodoApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoApp(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String subTitle;
  MyHomePage({Key key, this.title, this.subTitle}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    

     return Scaffold(
       body: Container(
         width: width,
         height: height,
         color: Colors.amberAccent,
         padding: EdgeInsets.only(top: 25),
         child: Column(
           //crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ToDoComp(
               title: "hello world",
               date:"2021/20/02",
               description: "this is a test description",
             ),
             ToDoComp(
               title: "hello world 2 ",
               date:"2021/20/02",
               description: "this is a test description",
             ),
             
             

             
           ]
           
           ,),
       ),
      
      
       
    );
  }
}
