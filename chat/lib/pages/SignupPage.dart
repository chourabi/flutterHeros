import 'package:chat/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

TextEditingController _emailControl = new TextEditingController();
TextEditingController _passwordControl = new TextEditingController();

  bool _isLoading = false;
  String _errMessage ="";

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  


  _signupAccount(String email, String password){

    setState(() {
      _isLoading = ! _isLoading;
      _errMessage="";
    });
    auth.createUserWithEmailAndPassword(email: email, password: password).then(( response){
      setState(() {
        _isLoading = ! _isLoading;
      });

      print(response);

      // insert user firestore

     

      firestore.collection("users").doc(response.user.uid).set({
        "email":response.user.email

      }).then((value) => null);


      Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
     
       
         
    }).catchError((e){


      setState(() {
        _isLoading = ! _isLoading;
        _errMessage = e.code;
      });
      
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text('SIGN UP '),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  errorText:  null
                ),
                controller: _emailControl,

              ),
            ),
            Container(
              
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _passwordControl,
                obscureText: true,

              ),
            ),

            _isLoading == false ?

            RaisedButton(
              onPressed: (){
                // create account firebase


                _signupAccount(_emailControl.text, _passwordControl.text);



              },
              child: Text('CREATE ACCOUNT'),
            ):

            CircularProgressIndicator(),


            _errMessage == "" ? Container() : 

            Container(
              margin: EdgeInsets.all(15
              ),
              padding: EdgeInsets.all(20),
              color: Colors.red.shade700,
              child: Text(_errMessage, style: TextStyle(color: Colors.white),),
            )


            ,

            FlatButton(
              child: Text("Create account"),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            )
            
          ],
        ),
      ),
      
     
    );
  }
}