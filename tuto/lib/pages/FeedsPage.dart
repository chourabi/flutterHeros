import 'package:flutter/material.dart';
import 'package:tuto/comp/Feed.dart';

class FeedsPage extends StatefulWidget {
  FeedsPage({Key key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {

  List<dynamic> _feeds = new List();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _feeds = [
            {
              "title":"helloworld",
              "likes":15
            },
            {
              "title":"helloworld",
              "likes":118
            },
            {
              "title":"helloworld",
              "likes":19
            },
            {
              "title":"helloworld",
              "likes":4
            },
            
            
            
          ];


  }









  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: new Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 18, itemBuilder: (context, index) {
                return Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      
                      child: Container(
                        width: 106,
                        height: 106,
                        //color: Colors.blue,
                        margin: EdgeInsets.all(15),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          backgroundImage: NetworkImage('https://p.kindpng.com/picc/s/78-785827_user-profile-avatar-login-account-male-user-icon.png'),
                        ),
                      ),
                      //top: 0,
                    ),
                    Positioned(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                         color: index % 2 == 0 ? Colors.green.shade300 : Colors.red.shade300,
                         border: Border.all(width: 5,color: Colors.white),
                         borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                      bottom: 0,
                      right: 0,
                      
                    )
                  ],
                );
              },),
            ),
            
            Container(
              height: (h-150),
              child: ListView.builder(itemCount: _feeds.length,itemBuilder: (context, index) {
        return FeedBloc(likes: _feeds[index]['likes'],);
      },),
            )


          ],
        ),
      )
    );
  }
}
