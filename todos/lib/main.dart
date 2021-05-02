import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todos/pages/AddNote.dart';

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
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key }) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Map> _notes = new List();


  _refresh()async {
    
    var db = await openDatabase('my_db.db');
    List<Map> list = await db.rawQuery('SELECT * FROM notes');

    setState(() {
      _notes = list;
    });
  }

  _openDataBase()async{

    var db = await openDatabase('my_db.db');

    await db.execute(  'CREATE TABLE IF NOT EXISTS notes  (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)');
    //await db.execute(  'DROP TABLE notes  ');
    
    /*await db.insert('notes', {
     'title': "first test note",
     'description': 'first test description'
    });*/

    List<Map> list = await db.rawQuery('SELECT * FROM notes');

    setState(() {
      _notes = list;
    });

    print(list);

  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _openDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQF"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new AddNote( refresh: _refresh );
          },));
        },
      ),
      body: Builder(builder: (context) {
        return Container(
        child: ListView.builder(itemCount: _notes.length, itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index]['title']),
            subtitle: Text(_notes[index]['description']),
            trailing: IconButton(
              icon: Icon(Icons.delete,color: Colors.redAccent,),
              onPressed: () async {
                int id = _notes[index]['id'];

                  var db = await openDatabase('my_db.db');

                 
                  _refresh();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      onVisible: (){
                       
                      },
                      content: Text("Do you really want to delete note N° $id "),
                      action: SnackBarAction(
                        label: 'CONFIRM',
                        onPressed: () async{
                           await db.execute(  'DELETE FROM notes WHERE id = ?',[id]);
                           _refresh();
                           
                        },
                      ),
                    )
                  );

                  
              },
            ),
            
          );
        },),
      );
      },),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
