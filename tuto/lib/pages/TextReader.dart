import 'package:flutter/material.dart';

class TextReader extends StatefulWidget {
  TextReader({Key key}) : super(key: key);

  @override
  _TextReaderState createState() => _TextReaderState();
}

class _TextReaderState extends State<TextReader> {
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;
  bool _isDark = false;
  bool _textSizeState = false;
  

  double _getTextSize(){
    if (_textSizeState == false) {
      return 18;
    }
    if (_textSizeState == true) {
      return 20;
    }
    if (_textSizeState == null) {
      return 25;
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text("Reader"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_1),
            onPressed: (){
              setState(() {
                if (_isDark == false) {
                  _bgColor = Colors.black;
                  _textColor = Colors.white;
                } else {
                   _bgColor = Colors.white;
                  _textColor = Colors.black;
                }
                _isDark = ! _isDark;
              });
            },
          ),

          Row(
            children: [
              Icon(
                Icons.format_size
              ),
              Checkbox(
                tristate: true,
                value: _textSizeState,
                onChanged: (bool state){
                  setState(() {
                    _textSizeState = state;
                  });
                },

              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ',
            style: TextStyle(
              color: _textColor,
              fontSize: _getTextSize()
              ),
            ),
        ),
      )
    );
  }
}