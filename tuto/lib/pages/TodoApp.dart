import 'package:flutter/material.dart';
import 'package:tuto/pages/TodoAdd.dart';

class TodoApp extends StatefulWidget {
  TodoApp({Key key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<dynamic> _todos = new List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  void _addTodo(String title,String description){

    setState(() {
      _todos.add(
        {
          "title":title,
          "description":description,
          "date":new DateTime.now(),
          "done":false
        }
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return TodoAdd(addTodoFunction: _addTodo,);
        },));
      },
      child: Icon(Icons.add),
      ),

      body: ListView.builder(itemCount: _todos.length,itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: (){
              setState(() {
                _todos[index]['done'] = true;
              });
            },
            child: Card(
            
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 10),
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_todos[index]['title'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                Text(_todos[index]['description'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                Text(_todos[index]['date'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                Container(
                  height: 30,
                  width: 80,
                  padding: EdgeInsets.all(5),

                  color: _todos[index]['done']==true ? Colors.greenAccent:Colors.redAccent,
                  child: Text(_todos[index]['done']==true ? 'Done':'In progress'),
                )

              ],
            ),
            ),
          ),
          )

        );
      },),
    );
  }
}