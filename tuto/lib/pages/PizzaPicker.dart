import 'package:flutter/material.dart';

class PizzaPicker extends StatefulWidget {
  PizzaPicker({Key key}) : super(key: key);

  @override
  _PizzaPickerState createState() => _PizzaPickerState();
}

class _PizzaPickerState extends State<PizzaPicker> {

  List _ings = [
    { "id":"1-A", "title":"SALT" , "selected":false },
    { "id":"2-B", "title":"THON", "selected":false },
    { "id":"3-C", "title":"JOMBON", "selected":false },
    
    
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(children: [
        Container(
          child: Column(
            children: [
              Container(height: 50,),
              Container(
                width: 200,
                child: Image.asset("assets/popular4.png"),
              ),
              Container(height: 15,),
              Container(
                
                child: Text('SUPER PIZZA',
                style: TextStyle(
                  fontSize: 30
                ),
                ),
              ),
              Container(
                height: 15,
              ),
              Container(
                
                child: Text('super pizza description, super pizza description, super pizza description, ',
                style: TextStyle(
                  fontSize: 20
                ),
                textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
          height: (h-16)*0.5,
        ),
        Divider(
          color: Colors.amberAccent,
          thickness: 5,
        ),
        Container(
          height: (h-16)*0.5,

          child: ListView.builder(
            itemCount: _ings.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: _ings[index]['selected'],
                ),
                title: Text( _ings[index]['title']),
                subtitle: Text( _ings[index]['id']),
                onTap: (){
                  setState(() {
                    _ings[index]['selected']=  ! _ings[index]['selected'];
                  });
                },
                
                
                
              );
            },
          ),
        ),
        
      ],),

    );
  }
}