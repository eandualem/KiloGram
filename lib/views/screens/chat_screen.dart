// import 'package:flutter/material.dart';
// import 'package:kilogram/views/widgets/chat_bubble.dart';
// import 'package:kilogram/views/widgets/message_area.dart';
// import 'package:tdlib/td_api.dart';
//
// class ChatScreen extends StatefulWidget {
//
//   final Chat chat;
//   ChatScreen({this.chat});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     int prevUserId;
//     return Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         appBar: AppBar(
//           title: Text(widget.chat.title,
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.call),
//               color: Colors.white,
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.web_sharp),
//               color: Colors.white,
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.more_vert),
//               color: Colors.white,
//               onPressed: () {},
//             ),
//           ],
//           backgroundColor: Theme.of(context).primaryColor,
//           elevation: 0,
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30),
//                     )
//                 ),
//                 child: ListView.builder(
//                   reverse: true,
//                   padding: EdgeInsets.all(20),
//                   itemCount: 1,
//                   itemBuilder: (BuildContext context, int index) {
//                     final Message message = widget.chat.lastMessage.content;
//                     final bool isMe = message.sender.id == currentUser.id;
//                     final bool isSameUser = prevUserId == message.sender.id;
//                     prevUserId = message.sender.id;
//                     return ChatBubble(message: message, isMe: isMe, isSameUser: isSameUser);
//                   },
//                 ),
//               ),
//             ),
//             MessageArea(),
//           ],
//         ),
//     );
//   }
// }
