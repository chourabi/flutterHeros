import 'package:flutter/material.dart';

class ToastMessage extends StatefulWidget {
  ToastMessage({Key key}) : super(key: key);

  @override
  _ToastMessageState createState() => _ToastMessageState();
}

class _ToastMessageState extends State<ToastMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Builder(
        builder: (ctx) {
          return (Center(
            child: 
            /*FlatButton(
              child: Text('show toast message'),
              onPressed: () {
                Scaffold.of(ctx).showSnackBar(SnackBar(
                  content: Text('Yay! A SnackBar!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                ));
              },
            ),*/

            FlatButton(
              child: Text('PICK DATE TIME'),
              onPressed: ()  {
               showDatePicker(context: context, initialDate: new DateTime.now(), firstDate: new DateTime(2021), lastDate: new DateTime(2025)).then((date){
                 print(date);
               }).catchError((onError){

               });
              
              },
            )

          ));
        },
      ),
    );
  }
}
