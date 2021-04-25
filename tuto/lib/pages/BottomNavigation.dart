import 'package:flutter/material.dart';
import 'package:tuto/pages/PizzaPicker.dart';
import 'package:tuto/pages/TabsApp.dart';
import 'package:tuto/pages/TodoApp.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _contents = [
    TodoApp(),
    PizzaPicker(),
    TabsApp()
  ];
  int _index = 0;


 _showMyDialog(String title , String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(),
                Text("tchourabi@gmail.com")
              ],),
            ),

            ListTile(
              leading: Icon(Icons.headset),
              title: Text("Music"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: (){
                 Navigator.pop(context);
               _showMyDialog('OUPS','Sorry cannot connect to our servers.');
              },
            ),
            
          ],
        ),
      ),
      body: _contents.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int i){
          setState(() {
            _index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.local_pizza),
            title: Text('Pizza')
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.access_alarm),
            title: Text('TABS')
          ),
          
        ],
      ),
    );
  }
}