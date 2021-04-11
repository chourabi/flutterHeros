import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  
  String _errorEmail = null;
  String _passwordError = null;





  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Authentication"
              ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  errorText: _errorEmail
                ),
              ),
              TextField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: _passwordError
                ),
              ),

              FlatButton(
                onPressed: (){
                  String email = _email.text;
                  String password = _password.text;
                  
                  if (email == '') {
                    // todo
                    setState(() {
                      _errorEmail = 'This feild is required.';
                    });
                  }else{
                     setState(() {
                      _errorEmail = null;
                    });
                  }
                  if (password == '') {
                    // todo
                    setState(() {
                      _passwordError = 'This feild is required.';
                    });
                  }else{
                     setState(() {
                      _passwordError = null;
                    });
                  }

                  if (email != '' && password != '') {
                    print("ready to connect");
                  }
                  

                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Icon(Icons.local_gas_station),
                  Text('CONNECT')
                ],),
              )
              
            ],
          ),
        ),
      ),
    ));
  }
}
