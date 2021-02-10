import 'package:flutter/material.dart';
import 'package:kilogram/models/kilogram_chats.dart';

class Contacts extends StatefulWidget {
  KilogramChats _chats;
  Contacts(this._chats);

  @override
  _ContactsState createState() => _ContactsState(_chats);
}

class _ContactsState extends State<Contacts> {

  KilogramChats _chats;
  _ContactsState(this._chats);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            )
        ),
        child: ListView.builder(
            itemCount: _chats.getSize(),
            itemBuilder: (BuildContext context, int index){
              final chat = _chats.get(index);
              return GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                  decoration: BoxDecoration(
                    // color: chat ? Color(0xFFF2F6FE) : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                      // ImageWidget(isOnline: chat.sender.isOnline, imageUrl: chat.sender.imageUrl, unReadMessages: chat.unread ? 27 : 0,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      chat.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  chat.title,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "chat.lastMessage",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
