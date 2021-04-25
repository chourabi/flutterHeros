import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  SliverAppBarPage({Key key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("CollapsingToolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset('assets/popular4.png')),
            ),
          ];
        },
        body: ListView.builder(itemCount: 50, itemBuilder: (context, index) {
          return Text('item $index');
        },),
      ),
    );
  }
}
