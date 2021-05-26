import 'package:flutter/material.dart';

class MessageChat extends StatelessWidget {

  final double w;
  final String userEmail;
  final dynamic date;
  final String message;
  final bool isMe; 

  const MessageChat({Key key, this.w, this.userEmail, this.date, this.message, this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                        child: Row(

                          mainAxisAlignment: isMe ? MainAxisAlignment.end: MainAxisAlignment.start,
                          
                          children: [
                            Container(
                              width: w*0.7,
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.all(15),

                              decoration: BoxDecoration(
                                color: isMe ? Colors.grey.shade400: Colors.black,
                                borderRadius: BorderRadius.circular(60)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userEmail,
                                    style: TextStyle( color: isMe ? Colors.black: Colors.white ),
                                   ),
                                  Text(message,
                                   style: TextStyle( color: isMe ? Colors.black: Colors.white ),
                                  ),
                                  Text(date.toString(),
                                   style: TextStyle( color: isMe ? Colors.black: Colors.white ),
                                  ),
                                  
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
  }
}