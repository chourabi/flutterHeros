import 'package:chat/pages/HomePage.dart';
import 'package:chat/pages/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatefulWidget {
  BlankPage({Key key}) : super(key: key);

  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();
  }

  _checkAuth(){

    /*if( auth.currentUser == null ){
      // go to sign in page
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
    }else{
      // go to home page
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
    }*/


     Firebase .initializeApp().then((value){
        auth.userChanges().listen((value){
      
      if (value != null) {
        // connected
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

      }else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
      }
     });


    });



    // auth
    /*auth.signInWithEmailAndPassword(email: 'tchrouabi@gmail.com', password: '123456789').then((res){
      print(res.user);
    });*/

    //auth.signOut().then((value) => null);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}