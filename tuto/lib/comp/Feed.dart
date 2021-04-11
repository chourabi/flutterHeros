import 'package:flutter/material.dart';

class FeedBloc extends StatefulWidget {
  final int likes;
  const FeedBloc({Key key, this.likes}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedBlocState();
  }

  
}

class _FeedBlocState extends State<FeedBloc>{

 int likes;
 bool didLike = false;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    likes = widget.likes;
  }



@override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return new Container(
              width: w,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  

                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: CircleAvatar(
                          radius: 40,
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text("Super User",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25)),
                            new Text('2020/02/02'),
                          ],
                        ),
                      ),
                      
                    ],
                  ),


                  Container(height: 15,),
                  Container(
                    height: 250,
                    color: Colors.orange,
                  ),

                  Divider(
                    height: 15,
                    thickness: 5,
                    color: Colors.red,
                  ),
                  
                  Row(
                   
                    children: [
                      Container(
                        padding: EdgeInsets.only(right:5),
                        width: ((w-30) / 3),
                        child: FlatButton(
                          child: Text( didLike == true ? '$likes DISLIKE' : '$likes LIKE' ),
                          onPressed: () {
                            setState(() {
                              didLike = ! didLike;
                              likes = didLike == false ? likes-1 : likes+1 ;
                            });
                          },
                        ),
                      ),
                      Container(
                        
                        width: ((w-30)  / 3),
                        child: FlatButton(
                          child: Text('COMMENT'),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left:5),
                        width: ((w-30)  / 3),
                        child: FlatButton(
                          child: Text('SHARE'),
                          onPressed: () {},
                        ),
                      ),
                      
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 5,
                    color: Colors.red,
                  ),
                ],
              ),
            );
            
  }
  
}