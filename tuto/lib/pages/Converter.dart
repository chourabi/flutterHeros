import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  Converter({Key key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {

  TextEditingController _value = new TextEditingController();
  String _valueTND="";
  String _devis = 'EUR';
  String _converted='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (String str){
              setState(() {
                _valueTND = str;
              });

              // convertion
              switch (_devis) {
                case 'EUR':
                  _converted = ((double.parse(_valueTND)) / 3.7).toString();
                  break;
                   case 'USD':
                  _converted = ((double.parse(_valueTND)) / 2.3).toString();
                  break;
                default:
              }
            },
            controller: _value,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              
              hintText: 'Value TND',
              
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:25),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
              Row(children: [
                Radio(
                  onChanged: (v){
                    setState(() {
                      _devis = v;
                    });
                  },
                  groupValue: _devis,
                  value: 'EUR',
                ),Text('EUR')
              ],),
              Row(children: [
                Radio(
                  onChanged: (v){
                    setState(() {
                      _devis = v;
                    });
                  },
                  groupValue: _devis,
                  value: 'USD',
                ),Text('USD')
              ],),
              
            ],)
          ),
          Container(
            margin: EdgeInsets.only(top:25),
            width: MediaQuery.of(context).size.width,
            child: Text('$_valueTND TND'),
          ),
          Container(
            margin: EdgeInsets.only(top:25),
            width: MediaQuery.of(context).size.width,
            child: Text('$_converted $_devis'),
          )
          
        ],
      ),
      )
    );
  }
}