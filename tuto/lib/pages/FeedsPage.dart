import 'package:flutter/material.dart';
import 'package:tuto/comp/Feed.dart';

class FeedsPage extends StatefulWidget {
  FeedsPage({Key key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: new SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 25),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedBloc(likes:15),
            FeedBloc(likes:16),
            
          ],
        ),
      ),
      ),
    );
  }
}
