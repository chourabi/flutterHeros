import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


  File _image;
  List<File> _pickedIamages = new List();

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        setState(() {
          _pickedIamages.add(File(pickedFile.path));
        });

      } else {
        print('No image selected.');
      }
    });
  }






  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(25),
       child: Column(children: [
         GestureDetector(
           child: CircleAvatar(
           radius: 80,
           backgroundImage: _image != null ? FileImage(_image) : NetworkImage("https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),

         ),

         onTap: (){
           showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
            new ListTile(
            leading: new Icon(Icons.camera),
            title: new Text('Camera'),
            onTap: ()  {
              getImage(ImageSource.camera);
              Navigator.pop(context);
            }          
          ),
          new ListTile(
            leading: new Icon(Icons.image),
            title: new Text('Gallery'),
            onTap: ()  {
                getImage(ImageSource.gallery);
                Navigator.pop(context);
            },          
          ),
            ],
          ),
          );
      }
    );
         },
         ),

         Container(
           height: 250,
           child: GridView.builder(
             itemCount: _pickedIamages.length,
             
             gridDelegate: 
           SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              )
           , itemBuilder: (context, index) {
             return(
               Container(
                 color: Colors.amberAccent,
                 child: Image.file(_pickedIamages[index],fit: BoxFit.cover,),
               )
             );
           },),
         )

       ],),
    );
  }
}