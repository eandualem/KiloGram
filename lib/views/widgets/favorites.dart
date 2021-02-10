import 'package:flutter/material.dart';
import 'package:kilogram/services/chat_service.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favorite Contacts",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,

                  ),),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30,
                  color: Colors.blueGrey,
                  onPressed: (){},
                )
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10),
              itemCount: context.read<ChatService>().chats.getSize(),
              itemBuilder: (BuildContext context, int index){
              final chat = context.read<ChatService>().chats.get(index);

              return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      // ImageWidget(isOnline: favorites[index].isOnline, imageUrl: favorites[index].imageUrl),
                      SizedBox(height: 6,),
                      Text(chat.title,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),),
                    ]),
                  ),
                );
              }
            )

          )
        ]
      ),
    );
  }
}
