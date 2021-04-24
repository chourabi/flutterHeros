import 'package:flutter/material.dart';

class TodoAdd extends StatefulWidget {
  final dynamic addTodoFunction;

  TodoAdd({Key key, this.addTodoFunction,}) : super(key: key);

  @override
  _TodoAddState createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  dynamic _addFunction;

  TextEditingController _title = new TextEditingController();
  
  TextEditingController _description = new TextEditingController();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addFunction = widget.addTodoFunction;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
        children: [
          TextField(
            controller: _title,
            decoration: InputDecoration(
              hintText: "Title"
            ),
          ),
         TextField(
           controller: _description,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Description"
            ),
          ),

          Container(

            child: FlatButton(
              color: Colors.amber,
        onPressed: (){
          _addFunction(_title.text,_description.text);
          Navigator.pop(context);
        },
        child: Text('add todo'),
      ),
          )
        ],
      ),
      ),
    );
  }
}