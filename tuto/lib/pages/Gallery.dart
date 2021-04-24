import 'package:flutter/material.dart';

class GalleryPhoto extends StatefulWidget {
  GalleryPhoto({Key key}) : super(key: key);

  @override
  _GalleryPhotoState createState() => _GalleryPhotoState();
}

class _GalleryPhotoState extends State<GalleryPhoto> {
  List _items = [
    { 'index' : 1 , 'deleted' : false },
    { 'index' : 2 , 'deleted' : false },
    { 'index' : 3 , 'deleted' : false },
    { 'index' : 4 , 'deleted' : false },
    { 'index' : 5 , 'deleted' : false },
    { 'index' : 6 , 'deleted' : false },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: (){
              setState(() {
                _items.elementAt(index)['deleted']=true;
              });
            },
            child: Container(
            color: _items[index]['deleted'] == false ? Colors.purple : Colors.white,
            child: Center(
              child: Text('${_items[index]['index']}',style: TextStyle(fontSize: 50,color: _items[index]['deleted'] == false ? Colors.amber : Colors.white ) ),
            ),
          ),
          );
        },
        itemCount: _items.length,
        )
    );
  }
}