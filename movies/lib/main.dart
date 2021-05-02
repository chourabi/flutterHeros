import 'package:flutter/material.dart';
import 'package:movies/tabs/FavsTab.dart';
import 'package:movies/tabs/HomeTab.dart';
import 'package:movies/tabs/ProfileTab.dart';
import 'package:movies/tabs/SearchTab.dart';
import 'package:movies/tabs/SettingTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp>{

  bool _isDark = false;


  _updateTheme()async {
    print("updating theme");
    setState(() {
      _isDark = ! _isDark;
    });

    // save the value in the sh pref "isDark"
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark",_isDark);

  }

  _checkIfIsDark() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool("isDark");

    if (isDark != null) {
          setState(() {
            _isDark =  isDark;
          });
    }

    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfIsDark();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: _isDark ? Brightness.dark :Brightness.light ,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(updateTheme: _updateTheme,),
    );
  }
}




class MyHomePage extends StatefulWidget {
  final dynamic updateTheme;
  
  MyHomePage({Key key, this.title, this.updateTheme}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  dynamic _fnUpdate;
  int _selectedIndex = 0;

  List<Widget> _tabs = [
    new HomeTab(),
    new SearchTab(),
    new FavoriteTab()

    
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fnUpdate = widget.updateTheme;
    _tabs.add(    new SettingTab(updateTheme: _fnUpdate));
    _tabs.add(    new ProfileTab());
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (int i){
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favoris")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Setting")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile")
          ),
          
        ],
      ),
      
    );
  }
}
