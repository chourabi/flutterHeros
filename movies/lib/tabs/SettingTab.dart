import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  final dynamic updateTheme;


  SettingTab({Key key, this.updateTheme}) : super(key: key);

  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {

  dynamic _updateFN;


  bool _isDarkMode = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateFN = widget.updateTheme;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [

          ListTile(
            title: Text("Dark mode"),
            subtitle: Text("by activting this the app will be dark"),
            trailing: Switch(
              onChanged: (bool s){
                setState(() {
                  _isDarkMode = s;

                  _updateFN();
                });
              },
              value: _isDarkMode,
            ),
          )
        ],
      ),
    );
  }
}