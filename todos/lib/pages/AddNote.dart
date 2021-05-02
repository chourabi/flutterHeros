import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AddNote extends StatefulWidget {
  final dynamic refresh;
  AddNote({Key key, this.refresh}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  dynamic _refresh;


  TextEditingController _title = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh = widget.refresh;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Note"),
      ),
      body: Container(
       child: SingleChildScrollView(
         
         child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _title,
                  decoration: InputDecoration(
                    hintText: 'Note Title'
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  maxLines: 5,
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: 'Note Description'
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: RaisedButton(
                  child: Text("Create"),
                  onPressed: ()async{
                    var db = await openDatabase('my_db.db');

                    
                    await db.insert('notes', {
                    'title': _title.text,
                    'description': _description.text
                    });
                    _refresh();
                    Navigator.pop(context);

                  },
                )
              ),
            ],
         ),
       ),
    )
    );
  }
}