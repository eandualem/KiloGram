import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kilogram/models/kilogram_chats.dart';
import 'package:kilogram/services/chat_service.dart';
import 'package:kilogram/services/client.dart';
import 'package:kilogram/views/screens/main_drawer.dart';
import 'package:kilogram/views/widgets/category_selector.dart';
import 'package:kilogram/views/widgets/contacts.dart';
import 'package:kilogram/views/widgets/favorites.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  ChatService _chatService = new ChatService(chats: new KilogramChats());

  @override
  void initState() {
    context.read<Client>().eventController.stream.listen(_chatService.onEvent);
    context.read<Client>().getMainChatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        title: Text('KiloGram',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/abstract-background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  // Favorites(),
                  Contacts(_chatService.chats),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
