import 'package:chat/comps/MessageChat.dart';
import 'package:chat/pages/SignInPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _message = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _sendMessage() {
    String msg = _message.text;
    if (msg != '') {
      _message.text = "";
      User user = auth.currentUser;
      print(user.uid);

      firestore.collection("messages").add({
        "message": msg,
        "senderID": user.uid,
        "date": new DateTime.now()
      }).then((value) => null);
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Stream collectionStream =
        FirebaseFirestore.instance.collection('messages').orderBy('date').snapshots();

    return Scaffold(
        appBar: AppBar(
          title: Text('CHAT'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;

                auth.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: w,
            child: Column(
              children: [
                // list view
                Container(
                  height: h - 128,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: collectionStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return new ListView(
                        //reverse: true,
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          bool isMe = false;
                          if (auth.currentUser.uid ==
                              document.data()['senderID']) {
                            isMe = true;
                          }
                          return FutureBuilder(
                            future: firestore
                                .collection("users")
                                .doc(document.data()['senderID'])
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Map<String, dynamic> data =
                                    snapshot.data.data();
                                return new MessageChat(
                                  w: w,
                                  userEmail: data["email"],
                                  message: document.data()['message'],
                                  date: document.data()['date'].toDate(),
                                  isMe: isMe,
                                );
                              }

                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                //bloc sender
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: (w - 20) * 0.8,
                        child: TextField(
                          controller: _message,
                          decoration:
                              InputDecoration(hintText: "your message please"),
                        ),
                      ),
                      Container(
                          width: (w - 20) * 0.2,
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              _sendMessage();
                            },
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
